<?php
// Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
function sopfr(int $n): int {
    $total = 0;
    for ($p = 2; $p * $p <= $n; $p++) {
        while ($n % $p === 0) { $total += $p; $n = intdiv($n, $p); }
    }
    return $total + ($n > 1 ? $n : 0);
}

echo implode(" ", array_filter(range(2, 109), fn($n) => sopfr($n) === sopfr($n + 1))), "\n";
