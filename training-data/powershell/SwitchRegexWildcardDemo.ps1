function Get-InputKind {
    param([string]$Text)
    switch -Regex ($Text) {
        '^\d+$'            { 'integer'; break }
        '^\d+\.\d+$'       { 'decimal'; break }
        '^[\w.]+@[\w.]+$'  { 'email'; break }
        default            { 'text' }
    }
}

'42', '3.14', 'a@b.com', 'hello' | ForEach-Object {
    "{0,-8} -> {1}" -f $_, (Get-InputKind $_)
}

switch -Wildcard ('report_2024.csv') {
    '*.csv' { 'csv file' }
    'report*' { 'a report' }
}

switch (5, 15, 25) {
    { $_ -lt 10 } { "$_ is small" }
    { $_ -ge 10 -and $_ -lt 20 } { "$_ is medium" }
    default { "$_ is large" }
}
