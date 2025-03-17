$outarray = @()
$url = 'https://<redacted>/api/v2.2/groups/72'
$type = 'application/json'
$props = @{
    Uri = $url 
    Headers = @{
    ContentType = $type
    Authorization = "Token <redacted>"
    }
}

$postResponse = Invoke-RestMethod @props -Method 'GET' -SkipCertificateCheck
$result = $postResponse | Select-Object @{Name="members"; Expression={$_.members}}

foreach ($r in $result) {
    $outarray += $r
}
$outarray = ($outarray.members -join "`n")
$outarray | Out-File "C:\users\<redacted>\documents\vectraBenignIPs.csv"