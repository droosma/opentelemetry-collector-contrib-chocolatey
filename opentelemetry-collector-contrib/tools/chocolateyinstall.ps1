
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.151.0/otelcol-contrib_0.151.0_windows_x86.msi'
$checksum = 'c76c3e969b5d033b9ef63fd713082444aa66ebe530348029dc4b28d703be80cb'
$url64 = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.151.0/otelcol-contrib_0.151.0_windows_x64.msi'
$checksum64 = '39992a3d297ba3e03ff9e9a9450b1d12ce229e9527d0904e8e5c15ff8f1aa8d7'

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

















