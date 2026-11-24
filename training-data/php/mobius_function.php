<?php
// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
function mobius(int $n): int {
    $result = 1;
    for ($p = 2; $p * $p <= $n; $p++) {
        if ($n % $p === 0) {
            $n = intdiv($n, $p);
            if ($n % $p === 0) return 0;
            $result = -$result;
        }
    }
    return $n > 1 ? -$result : $result;
}

echo implode(" ", array_map('mobius', range(1, 30))), "\n";
