$people = @(
    [PSCustomObject]@{ Name = "Alice"; Age = 30 }
    [PSCustomObject]@{ Name = "Bob"; Age = 25 }
)

$json = $people | ConvertTo-Json
$json

$fromJson = $json | ConvertFrom-Json
$fromJson[0].Name

$csv = $people | ConvertTo-Csv -NoTypeInformation
$csv

$fromCsv = $csv | ConvertFrom-Csv
$fromCsv[1].Name
