# Pronic numbers n(n+1)
function Get-Term([int]$n) { [math]::Floor($n * ($n + 1)) }

(0..9 | ForEach-Object { Get-Term $_ }) -join ' '
