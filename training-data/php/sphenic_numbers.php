<?php
function isSphenic(int $n): bool {
    $distinct = 0;
    for ($p = 2; $p * $p <= $n; $p++) {
        if ($n % $p === 0) {
            $n = intdiv($n, $p);
            if ($n % $p === 0) return false;
            $distinct++;
        }
    }
    return $distinct + ($n > 1 ? 1 : 0) === 3;
}

echo implode(" ", array_filter(range(2, 79), 'isSphenic')), "\n";
