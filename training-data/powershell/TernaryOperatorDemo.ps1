# The ternary operator requires PowerShell 7+
$n = 7
$parity = ($n % 2 -eq 0) ? 'even' : 'odd'
"$n is $parity"

1..5 | ForEach-Object { $_ -gt 3 ? "$_ big" : "$_ small" }

$value = $null
$shown = $value ? 'has value' : 'empty'
$shown

# Equivalent in Windows PowerShell
$old = if ($n -gt 5) { 'large' } else { 'small' }
$old
