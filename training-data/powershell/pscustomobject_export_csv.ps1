$rows = 1..3 | ForEach-Object {
    [pscustomobject]@{ Id = $_; Square = $_ * $_ }
}
$rows | Export-Csv -NoTypeInformation -Path "$env:TEMP/squares.csv"
Import-Csv "$env:TEMP/squares.csv" | Format-Table
