[cmdletbinding()]
param(
  [Parameter(Mandatory=$true)]
  [String]$PuppetEditorServicesGitRef,

  [Parameter(Mandatory=$false)]
  [Switch]$Clean
)

$ErrorActionPreference = 'Stop'

$TempPath = Join-Path "$PSScriptRoot" '../tmp'
if (-not (Test-Path $TempPath)) { New-Item -Path $TempPath -ItemType Directory -Force | Out-Null }

$DocsOutput = Join-Path "$PSScriptRoot" '../editor-services/static/reference'
if (Test-Path $DocsOutput) {
  Write-Host "Clearing $DocsOutput ..."
  Remove-Item -Path $DocsOutput -Force -Recurse -Confirm:$False | Out-Null
}

$PESPath = Join-Path $TempPath 'editorservices'
if (-Not (Test-Path $PESPath)) {
  & git clone https://github.com/puppetlabs/puppet-editor-services.git $PESPath
}
Push-Location $PESPath
& git reset --hard $PuppetEditorServicesGitRef
Pop-Location

Push-Location $PESPath
& yard doc --yardopts "$PSScriptRoot/pes.yardopts" --output-dir $DocsOutput
Pop-Location

# --output-dir docs/reference
# --title "Puppet Editor Services"

# lib/**/*.rb
