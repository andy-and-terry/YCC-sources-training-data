<?php

function exponentialSearch(array $a, int $target): int
{
    $n = count($a);
    if ($n === 0) {
        return -1;
    }
    $bound = 1;
    while ($bound < $n && $a[$bound] < $target) {
        $bound *= 2;
    }
    [$lo, $hi] = [intdiv($bound, 2), min($bound, $n - 1)];
    while ($lo <= $hi) {
        $mid = intdiv($lo + $hi, 2);
        if ($a[$mid] === $target) {
            return $mid;
        }
        $a[$mid] < $target ? $lo = $mid + 1 : $hi = $mid - 1;
    }
    return -1;
}

$a = array_map(fn ($i) => $i * 3, range(0, 66));
echo exponentialSearch($a, 99), ' ', exponentialSearch($a, 100), ' ', exponentialSearch($a, 0), PHP_EOL;
