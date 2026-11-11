<?php
// Fermat primality test; Carmichael number 561 fools it.
function powmod(int $base, int $exp, int $mod): int {
    $result = 1;
    $base %= $mod;
    while ($exp > 0) {
        if ($exp & 1) $result = $result * $base % $mod;
        $base = $base * $base % $mod;
        $exp >>= 1;
    }
    return $result;
}

function probablyPrime(int $n): bool {
    return $n > 2 && powmod(2, $n - 1, $n) === 1;
}

foreach ([97, 91, 561] as $n) {
    echo $n, " ", probablyPrime($n) ? "true" : "false", "\n";
}
