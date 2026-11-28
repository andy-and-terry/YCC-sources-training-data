function Test-Automorphic([long]$n) {
    return ([string]($n * $n)).EndsWith([string]$n)
}

(0..999 | Where-Object { Test-Automorphic $_ }) -join ' '  # 0 1 5 6 25 76 376 625
