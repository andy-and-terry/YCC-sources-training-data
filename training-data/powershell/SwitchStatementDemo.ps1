function Get-Kind($value) {
    switch -Regex ($value) {
        '^\d+$'      { return 'integer' }
        '^\d+\.\d+$' { return 'decimal' }
        '^[a-z]+$'   { return 'lowercase word' }
        default      { return 'other' }
    }
}

foreach ($v in '42', '3.14', 'hello', 'Hi!') {
    "{0} -> {1}" -f $v, (Get-Kind $v)
}

switch (3) {
    1 { 'one' }
    { $_ -gt 2 } { 'greater than two' }
    default { 'fallback' }
}
