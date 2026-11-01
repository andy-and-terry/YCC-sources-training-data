# Positive n expressible as a*a + b*b with a, b >= 0.
function Test-Representable([int]$n) {
    for ($a = 0; $a * $a -le $n; $a++) {
        $b = [int][math]::Round([math]::Sqrt($n - $a * $a))
        if ($a * $a + $b * $b -eq $n) { return $true }
    }
    return $false
}

(1..30 | Where-Object { Test-Representable $_ }) -join ' '
