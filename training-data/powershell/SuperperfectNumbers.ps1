function Get-Sigma([int]$n) { (1..$n | Where-Object { $n % $_ -eq 0 } | Measure-Object -Sum).Sum }
(1..99 | Where-Object { (Get-Sigma (Get-Sigma $_)) -eq 2 * $_ }) -join ' ' # 2 4 16 64
