function Test-Prime {
    param([int]$Number)

    if ($Number -lt 2) { return $false }
    for ($i = 2; $i * $i -le $Number; $i++) {
        if ($Number % $i -eq 0) { return $false }
    }
    return $true
}

2..20 | Where-Object { Test-Prime $_ }
