function Get-Tau([int]$n) { (1..$n | Where-Object { $n % $_ -eq 0 }).Count }
(1..59 | Where-Object { $_ % (Get-Tau $_) -eq 0 }) -join ' ' # 1 2 8 9 12 18 24 36 40 56
