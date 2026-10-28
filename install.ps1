# Gnova Music — installer for Windows 10/11 (64-bit). No administrator rights needed.
#   irm https://raw.githubusercontent.com/W1nq-coder/gnova-music-download/main/install.ps1 | iex
$ErrorActionPreference = 'Stop'
$url = 'https://github.com/W1nq-coder/gnova-music-download/releases/latest/download/Gnova-Setup-Windows.exe'
$setup = Join-Path $env:TEMP 'Gnova-Setup-Windows.exe'

Write-Host 'Downloading Gnova Music...'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $url -OutFile $setup -UseBasicParsing

Write-Host 'Installing...'
# silent install with a desktop shortcut; Gnova starts when it is done
Start-Process -FilePath $setup -ArgumentList '/SILENT', '/SP-', '/NOCANCEL', '/TASKS=desktopicon' -Wait
Remove-Item $setup -ErrorAction SilentlyContinue
Write-Host 'Done! Gnova Music is in the Start menu and on the desktop.'
