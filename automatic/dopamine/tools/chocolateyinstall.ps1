$ErrorActionPreference = 'Stop';


$packageName= 'dopamine'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://www.digimezzo.com/content/software/dopamine/releases/Dopamine 1.3.0.927.msi'
$checksum = '4F0232E5113EBC07D9AB6F4E2D64019DE8882E4EC20E708C37A3178F9BBA1B32'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'dopamine*' 

  checksum      = $checksum
  checksumType  = 'sha256' 

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
