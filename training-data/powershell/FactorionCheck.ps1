$fact = 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880

function Test-Factorion([int]$n) {
    $sum = 0
    foreach ($ch in $n.ToString().ToCharArray()) { $sum += $fact[[int][string]$ch] }
    return $sum -eq $n
}

(1..49999 | Where-Object { Test-Factorion $_ }) -join ' '
