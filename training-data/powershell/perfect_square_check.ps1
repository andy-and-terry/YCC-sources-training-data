function Test-PerfectSquare([int]$n) {
    if ($n -lt 0) { return $false }
    $r = [int][math]::Round([math]::Sqrt($n))
    $r * $r -eq $n
}

(0..29 | Where-Object { Test-PerfectSquare $_ }) -join " "
