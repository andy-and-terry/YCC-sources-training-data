# Ways to write n as a sum of two or more consecutive positive integers.
function Get-PoliteWays([int]$n) {
    $ways = 0
    for ($k = 2; $k * ($k + 1) / 2 -le $n; $k++) {
        if (($n - $k * ($k - 1) / 2) % $k -eq 0) { $ways++ }
    }
    return $ways
}

(1..16 | ForEach-Object { Get-PoliteWays $_ }) -join ' '
