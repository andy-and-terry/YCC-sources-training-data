# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
function Get-Mobius([int]$n) {
    $result = 1
    for ($p = 2; $p * $p -le $n; $p++) {
        if ($n % $p -eq 0) {
            $n = [math]::Floor($n / $p)
            if ($n % $p -eq 0) { return 0 }
            $result = -$result
        }
    }
    if ($n -gt 1) { return -$result }
    return $result
}

(1..30 | ForEach-Object { Get-Mobius $_ }) -join ' '
