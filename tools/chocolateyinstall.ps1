$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = "https://github.com/emacs-eask/eask/releases/download/$($env:ChocolateyPackageVersion)/eask_$($env:ChocolateyPackageVersion)_win-x64.zip"
$url64      = "https://github.com/emacs-eask/eask/releases/download/$($env:ChocolateyPackageVersion)/eask_$($env:ChocolateyPackageVersion)_win-x64.zip"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  softwareName  = 'eask*'

  checksum      = '721AC91BF248D69C98538BA4C90AC7C804D5F3E0BFFAB15F6986067D2F3446CB'
  checksumType  = 'sha256'
  checksum64    = '721AC91BF248D69C98538BA4C90AC7C804D5F3E0BFFAB15F6986067D2F3446CB'
  checksumType64= 'sha256'

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
