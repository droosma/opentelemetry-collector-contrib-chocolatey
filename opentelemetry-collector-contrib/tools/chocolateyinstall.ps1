
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.154.0/otelcol-contrib_0.154.0_windows_x86.msi'
$checksum = 'ffee7e43f08c74afb50f3c4a7c3f1f17271dddc4033f485ca6f6b69f4bd1400e'
$url64 = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.154.0/otelcol-contrib_0.154.0_windows_x64.msi'
$checksum64 = '8f66d03efc41027a752e5f1f2c39b16cffb412e379ba54b7632e93ca06623665'

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

















