# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
function Get-Fact([int]$n) { $f = [long]1; for ($i = 2; $i -le $n; $i++) { $f *= $i }; $f }
function Get-Comb([int]$n, [int]$k) { [long]((Get-Fact $n) / ((Get-Fact $k) * (Get-Fact ($n - $k)))) }

$n = 5
(1..$n | ForEach-Object { [long]((Get-Comb ($n - 1) ($_ - 1)) * (Get-Fact $n) / (Get-Fact $_)) }) -join ' '
