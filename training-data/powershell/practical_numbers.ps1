# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
function Test-Practical([int]$n) {
    [long]$reach = 1   # bit i set <=> i is a subset sum
    for ($d = 1; $d -le $n; $d++) {
        if ($n % $d -eq 0) { $reach = $reach -bor ($reach -shl $d) }
    }
    [long]$mask = ([long]1 -shl ($n + 1)) - 1
    return (($reach -band $mask) -eq $mask)
}

(1..40 | Where-Object { Test-Practical $_ }) -join ' '
