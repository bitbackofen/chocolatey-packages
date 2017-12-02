import-module au

$releases = 'http://www.digimezzo.com/content/software/dopamine'

function global:au_SearchReplace {
  @{
    'tools\chocolateyInstall.ps1' = @{
      "(^[$]url\s*=\s*('.*')" = "`$1'$($Latest.URL)'"
      "(^[$]checksum\s*=\s*('.*')" = "`$1'$($Latest.Checksum)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases

  $re = "Dopamine ([1-9][0-9.,]*[0-9]).msi"
  $url = $download_page.links | Where-Object href -Match $re | Select-Object -Last 1 -expand href
  $url = $url.Trim('.')

  $version_re = "([1-9][0-9.,]*[0-9])"
  $version = $url | Select-String -Pattern $version_re | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value } 
  $url = $releases + $url

  $Latest = @{ URL = [uri]::EscapeUriString($url); Version = $version }
  return $Latest
}

update
