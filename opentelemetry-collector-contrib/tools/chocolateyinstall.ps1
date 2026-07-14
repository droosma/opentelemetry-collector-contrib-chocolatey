
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.156.0/otelcol-contrib_0.156.0_windows_x86.msi'
$checksum = '10b38105884923f713f62add0aec9617551d0bc544f0462030d054c2f52fc572'
$url64 = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.156.0/otelcol-contrib_0.156.0_windows_x64.msi'
$checksum64 = '3cbce805d40e95c9deb54273d72aa373c97e6e9fb24170f66a42e7bb9aad4d22'

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

















