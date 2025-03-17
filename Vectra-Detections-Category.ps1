$outarray = @()
$url = 'https://<redacted>/api/v2.2/detections?category=command&detection=hidden&page_size=5000'
$type = 'application/json'
$props = @{
    Uri = $url 
    Headers = @{
    ContentType = $type
    Authorization = "Token <redacted>"
    }
}

$postResponse = Invoke-RestMethod @props -Method 'GET' -Body '{"detection":"Hidden HTTPS Tunnel","page_size":5000,"query_string":"all"}' -SkipCertificateCheck
$result = $postResponse.results

foreach ($r in $result) {
    $outarray += $r
}
$outarray | Export-Csv "C:\users\<redacted>\documents\vectra.csv" -NoTypeInformation