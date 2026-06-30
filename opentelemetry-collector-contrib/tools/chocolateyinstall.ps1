
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.155.0/otelcol-contrib_0.155.0_windows_x86.msi'
$checksum = 'a67a7322abdb65d0b5d45d851264cd21e1194baa3925ce7f8ab183d3d7581c62'
$url64 = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.155.0/otelcol-contrib_0.155.0_windows_x64.msi'
$checksum64 = '6a01f1d5f6cea09f5c382370103d028df349a7a0d9eb420d0778e8a0d71bd9a4'

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

















