function Get-Sigma([int]$N) {
    (1..$N | Where-Object { $N % $_ -eq 0 } | Measure-Object -Sum).Sum
}

(1..20 | Where-Object { (Get-Sigma $_) -lt 2 * $_ }) -join ' '
