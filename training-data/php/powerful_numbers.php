<?php
function isPowerful(int $n): bool {
    for ($p = 2; $p * $p <= $n; $p++) {
        if ($n % $p === 0) {
            if ($n % ($p * $p) !== 0) return false;
            while ($n % $p === 0) $n = intdiv($n, $p);
        }
    }
    return $n === 1;
}

echo implode(" ", array_filter(range(1, 100), 'isPowerful')), "\n";
