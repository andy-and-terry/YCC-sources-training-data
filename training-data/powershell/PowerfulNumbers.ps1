function Test-Powerful([int]$n) {
    for ($p = 2; $p * $p -le $n; $p++) {
        if ($n % $p -eq 0) {
            if ($n % ($p * $p) -ne 0) { return $false }
            while ($n % $p -eq 0) { $n = $n / $p }
        }
    }
    return $n -eq 1
}

(1..100 | Where-Object { Test-Powerful $_ }) -join ' '
