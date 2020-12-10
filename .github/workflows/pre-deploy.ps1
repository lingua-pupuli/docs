#!/bin/pwsh
$ErrorActionPreference = 'Stop'

$VscodePath = Join-Path 'public' 'vscode'
$LinguaPath = Join-Path 'public' 'lingua-pupuli'

Write-Output 'Cleaning output directory...'
if (Test-Path -Path 'public') { Remove-Item -Path 'public' -Recurse -Force | Out-Null }

Write-Output 'Cloning vscode output repository...'
& git clone https://github.com/puppet-vscode/puppet-vscode.github.io.git $VscodePath --depth 1

Write-Output 'Cloning lingua-pupuli output repository...'
& git clone https://github.com/lingua-pupuli/lingua-pupuli.github.io.git $LinguaPath --depth 1

Function Invoke-Prune($RootPath) {
  Write-Output "Pruning ${RootPath}..."

  Get-ChildItem -Path $RootPath -Force | Where-Object { $_.Name -ne '.git' } | ForEach-Object {
    Remove-Item -Path $_ -Force -Recurse | Out-Null
  }
}

Invoke-Prune $VscodePath
Invoke-Prune $LinguaPath
