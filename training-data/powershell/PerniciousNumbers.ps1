# Pernicious numbers: the popcount is prime.
function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($d = 2; $d * $d -le $n; $d++) {
        if ($n % $d -eq 0) { return $false }
    }
    return $true
}

function Get-PopCount([int]$n) {
    $c = 0
    while ($n -gt 0) { $c += $n -band 1; $n = $n -shr 1 }
    return $c
}

(1..20 | Where-Object { Test-Prime (Get-PopCount $_) }) -join ' '
