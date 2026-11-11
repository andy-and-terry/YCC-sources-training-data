# Tetrahedral numbers n(n+1)(n+2)/6
function Get-Term([int]$n) { [math]::Floor((($n * ($n + 1)) * ($n + 2))/6) }

(0..9 | ForEach-Object { Get-Term $_ }) -join ' '
