# n is triangular iff 8n + 1 is a perfect square.
function Test-Triangular([int]$n) {
    $s = 8 * $n + 1
    $r = [int][math]::Round([math]::Sqrt($s))
    return $r * $r -eq $s
}

(0..20 | Where-Object { Test-Triangular $_ }) -join ' '
