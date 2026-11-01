# Sum of prime factors counted with multiplicity.
function Get-Sopfr([int]$n) {
    $total = 0
    for ($p = 2; $p * $p -le $n; $p++) {
        while ($n % $p -eq 0) { $total += $p; $n = $n / $p }
    }
    if ($n -gt 1) { $total += $n }
    return $total
}

(2..109 | Where-Object { (Get-Sopfr $_) -eq (Get-Sopfr ($_ + 1)) }) -join ' '
