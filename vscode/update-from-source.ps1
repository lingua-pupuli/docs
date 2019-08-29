[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)]
  [String]
  $ExtensionSourcePath
)

# Updates the documentation from a source repository for puppet-vscode

$ErrorActionPreference = 'Stop'

if (-Not (Test-Path -Path $ExtensionSourcePath)) {
  Throw "$ExtensionSourcePath does not exist"
}

$DocsRoot = Join-Path -Path (Join-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath 'content') -ChildPath 'en') -ChildPath 'docs'
$BlogRoot = Join-Path -Path (Join-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath 'content') -ChildPath 'en') -ChildPath 'blog'

<#
.SYNOPSIS
  Outputs to a UTF-8-encoded file *without a BOM* (byte-order mark).

.DESCRIPTION
  Mimics the most important aspects of Out-File:
  * Input objects are sent to Out-String first.
  * -Append allows you to append to an existing file, -NoClobber prevents
    overwriting of an existing file.
  * -Width allows you to specify the line width for the text representations
     of input objects that aren't strings.
  However, it is not a complete implementation of all Out-String parameters:
  * Only a literal output path is supported, and only as a parameter.
  * -Force is not supported.

  Caveat: *All* pipeline input is buffered before writing output starts,
          but the string representations are generated and written to the target
          file one by one.

.NOTES
  The raison d'être for this advanced function is that, as of PowerShell v5,
  Out-File still lacks the ability to write UTF-8 files without a BOM:
  using -Encoding UTF8 invariably prepends a BOM.

  Copyright (c) 2017 Michael Klement <mklement0@gmail.com> (http://same2u.net),
  released under the [MIT license](https://spdx.org/licenses/MIT#licenseText).

#>
function Out-FileUtf8NoBom {

  [CmdletBinding()]
  param(
    [Parameter(Mandatory, Position=0)] [string] $LiteralPath,
    [switch] $Append,
    [switch] $NoClobber,
    [AllowNull()] [int] $Width,
    [Parameter(ValueFromPipeline)] $InputObject
  )

  #requires -version 3

  # Make sure that the .NET framework sees the same working dir. as PS
  # and resolve the input path to a full path.
  [System.IO.Directory]::SetCurrentDirectory($PWD) # Caveat: .NET Core doesn't support [Environment]::CurrentDirectory
  $LiteralPath = [IO.Path]::GetFullPath($LiteralPath)

  # If -NoClobber was specified, throw an exception if the target file already
  # exists.
  if ($NoClobber -and (Test-Path $LiteralPath)) {
    Throw [IO.IOException] "The file '$LiteralPath' already exists."
  }

  # Create a StreamWriter object.
  # Note that we take advantage of the fact that the StreamWriter class by default:
  # - uses UTF-8 encoding
  # - without a BOM.
  $sw = New-Object IO.StreamWriter $LiteralPath, $Append

  $htOutStringArgs = @{}
  if ($Width) {
    $htOutStringArgs += @{ Width = $Width }
  }

  # Note: By not using begin / process / end blocks, we're effectively running
  #       in the end block, which means that all pipeline input has already
  #       been collected in automatic variable $Input.
  #       We must use this approach, because using | Out-String individually
  #       in each iteration of a process block would format each input object
  #       with an indvidual header.
  try {
    $Input | Out-String -Stream @htOutStringArgs | % { $sw.WriteLine($_) }
  } finally {
    $sw.Dispose()
  }
}

function Get-AvailableExtensionSettings($json) {
  $content = ""
  $json.contributes.configuration.properties | Get-Member -MemberType NoteProperty | Sort-Object | ForEach-Object {
    $propName = $_.Name
    $property = $json.contributes.configuration.properties."$propName"
    if ($property.description -notlike '`*`*DEPRECATED*') {
      $content += "#### $propName`n`n" + $property.description + "`n`n"
    }

    if ($null -ne $property.enum) {
      $content += "Possible values: " + ("``" + (($property.enum) -join "``, ``") + "``") + "`n`n"
    }

    if (($null -ne $property.default) -and ($property.default -ne '')) {
      $content += "Default: ``" + $property.default.ToString() + "```n`n"
    }
  }

  $content
}

function Get-DeprecatedExtensionSettings($json) {
  $content = ""
  $json.contributes.configuration.properties | Get-Member -MemberType NoteProperty | Sort-Object | ForEach-Object {
    $propName = $_.Name
    $property = $json.contributes.configuration.properties."$propName"
    if ($property.description -like '`*`*DEPRECATED*') {
      $content += "#### $propName`n`n" + $property.description.replace("**DEPRECATED**", "").Trim() + "`n`n"
    }
  }

  $content
}

function Update-TextChunk($content, $beforeMarker, $afterMarker, $replacement) {
  $beforeIndex = $content.IndexOf($beforeMarker)
  $afterIndex = $content.IndexOf($afterMarker)

  if ( ($beforeIndex -eq -1) -or ($afterIndex -eq -1) ) {
    Write-Output $content
    return
  }
  $toBeReplaced = $content.subString($beforeIndex, $afterIndex - $beforeIndex + $afterMarker.length)

  Write-Output ($content.replace($toBeReplaced, $beforeMarker + $replacement + $afterMarker))
}

function Update-ExtensionSettings() {
  $PackageJSONFile = Join-Path -Path $ExtensionSourcePath -ChildPath 'package.json'
  $packgeJson = Get-Content -Path $PackageJSONFile -Raw | ConvertFrom-JSON

  $DocsFile = Join-Path -Path $DocsRoot -ChildPath 'Extension Settings.md'
  $fileContent = Get-Content -Path $DocsFile -Raw

  $fileContent = Update-TextChunk `
    -Content $fileContent `
    -BeforeMarker "<!-- Begin Available Settings -->`n" `
    -AfterMarker "`n<!-- End Available Settings -->" `
    -Replacement (Get-AvailableExtensionSettings -Json $packgeJson)
  $fileContent = Update-TextChunk `
    -Content $fileContent `
    -BeforeMarker "<!-- Begin Deprecated Settings -->`n" `
    -AfterMarker "`n<!-- End Deprecated Settings -->" `
    -Replacement (Get-DeprecatedExtensionSettings -Json $packgeJson)

  $fileContent | Out-FileUtf8NoBom -LiteralPath $DocsFile
}

function Update-Releases() {
  $ChangeLog = Join-Path -Path $ExtensionSourcePath -ChildPath 'CHANGELOG.md'

  # Extract the ChangeLog information information into a hashtable
  $Releases = @{}

  $releaseText = ''
  $releaseVersion = ''
  Get-Content -Path $ChangeLog | ForEach-Object {
    $line = $_

    if ($null -ne $Matches) { $Matches.Clear() }
    if ( $line.StartsWith('## ') -or $line.StartsWith('[') ) {
      # Start of a new "section"
      if ($releaseVersion -ne '') {
        $Releases[$releaseVersion]["text"] = $releaseText.Trim()
      }
      if ($line -match '^## \[([\d.]+)\] - ([\d\-]+)') {
        $releaseVersion = $Matches[1]
        $Releases.Add($releaseVersion, @{ "text" = ""; "date" = $Matches[2]})
        $releaseText = ''
      }
      else {
        # It's not a release section so just ignore it.
        $releaseVersion = ''
      }
    }
    else {
      if ($releaseVersion -ne '') { $releaseText = $releaseText + "`n" + $line }
    }
  }

  # Now that all the releases are in a hash, output the files ...
  $Releases.GetEnumerator() | ForEach-Object {
    $ReleaseVersion = $_.Key
    $ReleaseInfo = $_.Value
    $filePath = Join-Path -Path (Join-Path -Path $BlogRoot -ChildPath 'releases') -ChildPath ($ReleaseVersion + '.md')

    Write-Output "Updating $filePath ..."
    @"
---
title: `"Release ${ReleaseVersion}`"
linkTitle: `"Release ${ReleaseVersion}`"
date: $($ReleaseInfo.date)
description: >
  VSCode Extension Release ${ReleaseVersion}
github_repo: `"`" # Disable the edit commands
---

$($ReleaseInfo.text)
"@ | Out-FileUtf8NoBom -LiteralPath $filePath
  }

  # Purge any other release files.
  Get-ChildItem -Path (Join-Path -Path $BlogRoot -ChildPath 'releases') -Filter "*.md" | ForEach-Object {
    $file = $_
    switch ($file.BaseName) {
      "_index" {} # Do Nothing
      Default {
        if ($null -eq $Releases[$file.BaseName]) {
          Write-Output "Removing $($file.Name) ..."
          $file | Remove-Item -Force | Out-Null
        }
      }
    }

  }
  # Write-Host ($Releases | COnvertTo-JSON -Depth 5)
}

# Generate the 'Extension Settings.md' docs page
Write-Output "Updating 'Extension Settings.md' document..."
Update-ExtensionSettings

Write-Output "Updating Releases ..."
Update-Releases

Write-Output "Done."
