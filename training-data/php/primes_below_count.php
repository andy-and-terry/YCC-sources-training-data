<?php
function countPrimesBelow(int $n): int {
    if ($n < 3) return 0;
    $sieve = array_fill(0, $n, true);
    $sieve[0] = $sieve[1] = false;
    for ($i = 2; $i * $i < $n; $i++) {
        if ($sieve[$i]) {
            for ($j = $i * $i; $j < $n; $j += $i) $sieve[$j] = false;
        }
    }
    return count(array_filter($sieve));
}

echo countPrimesBelow(100), PHP_EOL;
