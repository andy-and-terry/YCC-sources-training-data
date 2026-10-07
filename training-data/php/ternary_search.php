<?php

function ternarySearch(array $arr, int $target): int
{
    $lo = 0;
    $hi = count($arr) - 1;
    while ($lo <= $hi) {
        $third = intdiv($hi - $lo, 3);
        $m1 = $lo + $third;
        $m2 = $hi - $third;
        if ($arr[$m1] === $target) {
            return $m1;
        }
        if ($arr[$m2] === $target) {
            return $m2;
        }
        if ($target < $arr[$m1]) {
            $hi = $m1 - 1;
        } elseif ($target > $arr[$m2]) {
            $lo = $m2 + 1;
        } else {
            $lo = $m1 + 1;
            $hi = $m2 - 1;
        }
    }
    return -1;
}

$arr = [1, 3, 5, 7, 9, 11, 13, 15];
echo ternarySearch($arr, 9) . "\n";
echo ternarySearch($arr, 4) . "\n";
