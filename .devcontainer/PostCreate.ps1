Write-Host "Running npm install ..." -Foreground Yellow
& npm install

if (-Not (Test-Path './themes/docsy/assets')) {
  Write-Host "Installing Docsy submodule ..."
  Push-Location 'themes/docsy'
  & git submodule update -f --init --recursive --depth 1
  Pop-Location
}
