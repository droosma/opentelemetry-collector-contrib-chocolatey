
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.153.0/otelcol-contrib_0.153.0_windows_x86.msi'
$checksum = '1eac74a9ec99a76f434a05086b7d9951a77c61d8b92d0af04af316bf02ecd533'
$url64 = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.153.0/otelcol-contrib_0.153.0_windows_x64.msi'
$checksum64 = '9aae2f38290673b9cf270195c60ad4ca54a2f3cf2ab8ecfc1b1979d849ebefbb'

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

















