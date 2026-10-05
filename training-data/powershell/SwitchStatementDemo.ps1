function Get-SizeLabel {
    param([int]$Value)
    switch ($Value) {
        { $_ -lt 0 }   { return 'negative' }
        0              { return 'zero' }
        { $_ -le 10 }  { return 'small' }
        { $_ -le 100 } { return 'medium' }
        default        { return 'large' }
    }
}

foreach ($n in -5, 0, 7, 50, 500) {
    '{0,4} -> {1}' -f $n, (Get-SizeLabel -Value $n)
}

switch -Wildcard ('report-2024.csv') {
    '*.csv' { 'CSV file' }
    'report*' { 'A report' }
}

switch -Regex ('abc123') {
    '^\d+$'     { 'all digits' }
    '[a-z]+\d+' { 'letters then digits' }
}
