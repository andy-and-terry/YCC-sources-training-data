<?php
// Highest value reached by the Collatz (hailstone) sequence from n.
function peak(int $n): int {
    $best = $n;
    while ($n !== 1) {
        $n = $n % 2 === 0 ? intdiv($n, 2) : 3 * $n + 1;
        $best = max($best, $n);
    }
    return $best;
}

echo peak(27), "\n";
