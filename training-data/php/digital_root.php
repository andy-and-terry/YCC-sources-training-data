<?php

function digitalRootIter(int $n): int
{
    while ($n >= 10) {
        $n = array_sum(str_split((string) $n));
    }
    return $n;
}

function digitalRoot(int $n): int
{
    return $n === 0 ? 0 : 1 + ($n - 1) % 9;
}

foreach ([0, 16, 942, 132189, 493193, PHP_INT_MAX] as $n) {
    printf("%d -> %d (%s)\n", $n, digitalRoot($n), digitalRoot($n) === digitalRootIter($n) ? 'ok' : 'MISMATCH');
}
