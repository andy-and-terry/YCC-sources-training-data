# Lazy caterer sequence: max pieces from n cuts
function Get-Term([int]$n) { [math]::Floor((($n * ($n + 1))/2) + 1) }

(0..9 | ForEach-Object { Get-Term $_ }) -join ' '
