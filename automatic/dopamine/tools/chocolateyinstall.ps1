﻿$ErrorActionPreference = 'Stop';


$packageName= 'dopamine'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.digimezzo.com/content/software/dopamine/Dopamine%202.0%20(Release).msi'
$checksum = '94B7B01D68312BCB38D9C000FE45846C689C5CC11D4BD31795E0E0922F0E4035'

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
