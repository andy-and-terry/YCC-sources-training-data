# Centered square numbers 2n(n+1)+1
function Get-Term([int]$n) { [math]::Floor(((2 * $n) * ($n + 1)) + 1) }

(0..9 | ForEach-Object { Get-Term $_ }) -join ' '
