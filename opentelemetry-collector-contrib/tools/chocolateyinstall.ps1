
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.164.0/otelcol-contrib_0.164.0_windows_x86.msi'
$checksum = 'a6b60986edf5ac4ea99e2b4d78d04ccd6a16472a5e97f601d24e195e00fdfc5c'
$url64 = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.164.0/otelcol-contrib_0.164.0_windows_x64.msi'
$checksum64 = 'dcdae63474a3bb0b9bb09d869e4f6ddb5a0e22d1ed5cf299454336d69a69292b'

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

















