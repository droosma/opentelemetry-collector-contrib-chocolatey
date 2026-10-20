
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.163.1/otelcol-contrib_0.163.1_windows_x86.msi'
$checksum = 'f643224ef2d210c40a44a52c789450a75555b41915e39d79ccebcb6f8852e153'
$url64 = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.163.1/otelcol-contrib_0.163.1_windows_x64.msi'
$checksum64 = 'e4675c0c0606f7626513a1416fbb8390e2d27fd0fc95fbf1c32757037539276d'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = $url
  url64bit       = $url64

  softwareName   = 'opentelemetry-collector-contrib*'

  checksum       = $checksum
  checksumType   = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64     = $checksum64
  checksumType64 = 'sha256' #default is checksumType

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

















