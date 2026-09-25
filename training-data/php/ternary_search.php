<?php

function ternarySearch(array $a, int $target): int
{
    [$lo, $hi] = [0, count($a) - 1];
    while ($lo <= $hi) {
        $third = intdiv($hi - $lo, 3);
        [$m1, $m2] = [$lo + $third, $hi - $third];
        if ($a[$m1] === $target) {
            return $m1;
        }
        if ($a[$m2] === $target) {
            return $m2;
        }
        if ($target < $a[$m1]) {
            $hi = $m1 - 1;
        } elseif ($target > $a[$m2]) {
            $lo = $m2 + 1;
        } else {
            [$lo, $hi] = [$m1 + 1, $m2 - 1];
        }
    }
    return -1;
}

/** Maximum of a unimodal function on [lo, hi]. */
function argmax(callable $f, float $lo, float $hi): float
{
    while ($hi - $lo > 1e-9) {
        $m1 = $lo + ($hi - $lo) / 3;
        $m2 = $hi - ($hi - $lo) / 3;
        $f($m1) < $f($m2) ? $lo = $m1 : $hi = $m2;
    }
    return ($lo + $hi) / 2;
}

$a = [1, 3, 5, 7, 9, 11, 13, 15, 17];
echo implode(' ', array_map(fn ($t) => ternarySearch($a, $t), [1, 9, 17, 4])), PHP_EOL;
printf("argmax of -(x-2)^2+3 on [-10,10]: %.6f\n", argmax(fn ($x) => -($x - 2) ** 2 + 3, -10, 10));
