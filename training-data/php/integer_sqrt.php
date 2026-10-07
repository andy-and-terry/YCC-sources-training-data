<?php

function isqrt(int $n): int
{
    if ($n < 0) {
        throw new ValueError('negative');
    }
    if ($n < 2) {
        return $n;
    }
    $x = $n;
    $y = intdiv($x, 2);
    while ($y < $x) {
        $x = $y;
        $y = intdiv($x + intdiv($n, $x), 2);
    }
    return $x;
}

foreach ([0, 1, 2, 3, 15, 16, 17, 1_000_000, PHP_INT_MAX] as $n) {
    echo "isqrt($n) = ", isqrt($n), PHP_EOL;
}
