<?php

// Stooge sort: recursively sorts the first 2/3, last 2/3, then first 2/3 again. O(n^2.71).
function stoogeSort(array &$a, int $lo, int $hi): void
{
    if ($a[$lo] > $a[$hi]) {
        [$a[$lo], $a[$hi]] = [$a[$hi], $a[$lo]];
    }
    if ($hi - $lo + 1 > 2) {
        $t = intdiv($hi - $lo + 1, 3);
        stoogeSort($a, $lo, $hi - $t);
        stoogeSort($a, $lo + $t, $hi);
        stoogeSort($a, $lo, $hi - $t);
    }
}

$data = [2, 4, 5, 3, 1, 9, -2, 7];
stoogeSort($data, 0, count($data) - 1);
echo implode(' ', $data), PHP_EOL;
