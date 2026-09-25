<?php

function powMod(int $base, int $exp, int $mod): int
{
    $result = 1 % $mod;
    $base %= $mod;
    while ($exp > 0) {
        if ($exp & 1) {
            $result = $result * $base % $mod;
        }
        $base = $base * $base % $mod;
        $exp >>= 1;
    }
    return $result;
}

/** Fermat probable-prime test built on powMod (moduli must stay below ~3e9 to avoid overflow). */
function probablyPrime(int $n): bool
{
    if ($n < 4) {
        return $n >= 2;
    }
    foreach ([2, 3, 5, 7] as $a) {
        if ($n % $a === 0 || powMod($a, $n - 1, $n) !== 1) {
            return false;
        }
    }
    return true;
}

echo powMod(2, 10, 1000), ' ', powMod(3, 200, 13), ' ', powMod(7, 10 ** 18, 1_000_000_007), PHP_EOL;
echo implode(' ', array_filter(range(1_000_000_000, 1_000_000_100), 'probablyPrime')), PHP_EOL;
