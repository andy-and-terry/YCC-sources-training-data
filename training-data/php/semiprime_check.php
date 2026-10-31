<?php
function primeFactorCount(int $n): int {
    $count = 0;
    for ($p = 2; $p * $p <= $n; $p++) {
        while ($n % $p === 0) {
            $n = intdiv($n, $p);
            $count++;
        }
    }
    return $n > 1 ? $count + 1 : $count;
}

echo implode(" ", array_filter(range(2, 29), fn($n) => primeFactorCount($n) === 2)), "\n";
