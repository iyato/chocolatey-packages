﻿$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName32 = 'qbittorrent_enhanced_4.4.4.10_setup.exe'
$fileName64 = 'qbittorrent_enhanced_4.4.4.10_x64_setup.exe'


$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'exe'
  file         = Get-Item "$toolsDir\$fileName32"
  file64       = Get-Item "$toolsDir\$fileName64"
  softwareName = 'qbittorrent*'
  silentArgs   = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
Remove-Item -Path $packageArgs.file,$packageArgs.file64 -Force -ErrorAction SilentlyContinue
