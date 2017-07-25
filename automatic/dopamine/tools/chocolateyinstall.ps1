$ErrorActionPreference = 'Stop';


$packageName= 'dopamine'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://www.digimezzo.com/content/software/dopamine/releases/Dopamine 1.3.0.927.msi'
$checksum = '4F0232E5113EBC07D9AB6F4E2D64019DE8882E4EC20E708C37A3178F9BBA1B32'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url # download url, HTTPS preferred
  #url64bit      = '' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url
  #file         = $fileLocation

  softwareName  = 'dopamine*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = $checksum
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  #checksum64    = ''
  #checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
