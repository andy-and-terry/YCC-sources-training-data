$csv = "alpha,beta,,gamma"
$parts = $csv -split ','
"Parts: $($parts.Count)"
($csv -split ',' | Where-Object { $_ }) -join '|'
"a1b22c333" -split '\d+'
"one two  three" -split '\s+'
"2024-03-15".Split('-')[1]
"hello world".Replace('world', 'there')
"Hello" -replace '(l+)', '[$1]'
"x".PadLeft(4, '.') + "y".PadRight(3, '-') + "|"
