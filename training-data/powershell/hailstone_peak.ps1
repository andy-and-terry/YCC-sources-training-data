# Highest value reached by the Collatz (hailstone) sequence from n.
function Get-Peak([long]$n) {
    $best = $n
    while ($n -ne 1) {
        $n = if ($n % 2 -eq 0) { $n / 2 } else { 3 * $n + 1 }
        $best = [Math]::Max($best, $n)
    }
    $best
}

Get-Peak 27
