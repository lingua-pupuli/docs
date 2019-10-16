#!/bin/pwsh
$ErrorActionPreference = 'Stop'

$TimeStampString = (Get-Date).ToString('ddd MMM d HH:mm:ss K')
$VscodePath = Join-Path 'public' 'vscode'
$LinguaPath = Join-Path 'public' 'lingua-pupuli'
$GithubToken = $ENV:GITHUB_TOKEN

if ($null -eq $GithubToken) {
  Throw "This script requires the GITHUB_TOKEN environment variable"
}

Function Has-Changes {
  $result = (&git status --porcelain)
  Write-Output ($null -ne $result)
}

# Setup git info to actually do a commit
& git config --global user.email "54143644+lingua-pupuli-bot@users.noreply.github.com"
& git config --global user.name "Lingua Pupuli Bot"

@($VscodePath, $LinguaPath) | ForEach-Object {
  $RepoPath = $_
  Write-Output "----------------------`n${RepoPath}`n----------------------"

  Push-Location $RepoPath

  if (Has-Changes) {
    # Add changes to git.
    & git add .

    # Commit changes.
    $message = "Rebuilding site $TimeStampString"
    & git commit -m $message

    # Get the git remote URL and fudge in the bot credentials
    $RemoteURL = (&git remote get-url origin --push)
    $RemoteURL = $RemoteURL.replace('https://github.com', "https://lingua-pupuli-bot:${GithubToken}@github.com")

    # Push source and build repos.
    &git push -q $RemoteURL master
  } else {
    Write-Output "${RepoPath} has no changes"
  }
  Write-Output "`n`n"
  Pop-Location
}
