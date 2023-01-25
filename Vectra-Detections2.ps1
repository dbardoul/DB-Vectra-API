<#
.Synopsis
   Script that will leverage the Vectra API and query for a list of detections.
.DESCRIPTION
   This script was designed to accomplish something the GUI could not.
   In the Vectra web GUI, you cannot get a list of detections based on a protocol.
   In this script, you provide the protocol and a list is given.   
.OUTPUTS
   CSV file with list of detections
.NOTES
   Author : Devon Bardoul
   version: 1.0
   Date   : 29-07-2022
#>

$outarray = @()
$url = 'https://<hostname>/api/v2.2/detections/?page_size=5000'
$type = 'application/json'
$props = @{
    Uri = $url 
    Headers = @{
    ContentType = $type
    Authorization = "Token <token>"
    }
}

$postResponse = Invoke-RestMethod @props -Method 'GET' -Body '{"proto":"SMB","page_size":5000,"query_string":"all"}' -SkipCertificateCheck
$result = $postResponse.results

foreach ($r in $result) {
    $outarray += $r
}
$outarray | Export-Csv "C:\users\<username>\documents\vectra.csv" -NoTypeInformation