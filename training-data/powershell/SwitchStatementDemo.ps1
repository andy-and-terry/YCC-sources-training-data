function Get-SizeLabel {
    param([int]$Bytes)
    switch ($Bytes) {
        { $_ -lt 1KB } { return "$Bytes B" }
        { $_ -lt 1MB } { return "{0:N1} KB" -f ($Bytes / 1KB) }
        { $_ -lt 1GB } { return "{0:N1} MB" -f ($Bytes / 1MB) }
        default { return "{0:N1} GB" -f ($Bytes / 1GB) }
    }
}

foreach ($b in 500, 2048, 5242880, 3221225472) {
    Get-SizeLabel -Bytes $b
}

switch -Wildcard ("report_2024.csv") {
    "*.txt" { "text file" }
    "*.csv" { "csv file" }
    "report*" { "a report" }
}

switch -Regex ("abc123") {
    '^\d+$' { "digits only" }
    '\d' { "contains digits" }
    '^[a-z]+' { "starts with letters" }
}
