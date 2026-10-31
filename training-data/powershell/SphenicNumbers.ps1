function Test-Sphenic([int]$n) {
    $distinct = 0
    for ($p = 2; $p * $p -le $n; $p++) {
        if ($n % $p -eq 0) {
            $n = $n / $p
            if ($n % $p -eq 0) { return $false }
            $distinct++
        }
    }
    if ($n -gt 1) { $distinct++ }
    return $distinct -eq 3
}

(2..79 | Where-Object { Test-Sphenic $_ }) -join ' '
