$ErrorActionPreference = 'Stop';


$packageName= 'dopamine'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.digimezzo.com/content/software/dopamine/Dopamine%202.0.9%20(Release).msi'
$checksum = '6009410b99cc48b15c62b748c7e61d8586cf3ffbb4d2ea03d442e3557f272ffe'

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
