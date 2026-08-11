
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.158.0/otelcol-contrib_0.158.0_windows_x86.msi'
$checksum = '14f30f8695492d7f4186de6498f1646deaaacfa101784d9a57ed18bf74c42ea3'
$url64 = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.158.0/otelcol-contrib_0.158.0_windows_x64.msi'
$checksum64 = '10a3bd788217c418c2140817604e146929bd0c8cd7960add7c1cf15ac9a15212'

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

















