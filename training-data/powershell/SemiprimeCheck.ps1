function Get-PrimeFactorCount([int]$n) {
    $count = 0
    for ($p = 2; $p * $p -le $n; $p++) {
        while ($n % $p -eq 0) {
            $n = $n / $p
            $count++
        }
    }
    if ($n -gt 1) { $count++ }
    return $count
}

(2..29 | Where-Object { (Get-PrimeFactorCount $_) -eq 2 }) -join ' '
