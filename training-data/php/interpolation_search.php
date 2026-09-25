<?php

function interpolationSearch(array $a, int $target): int
{
    [$lo, $hi] = [0, count($a) - 1];
    while ($lo <= $hi && $target >= $a[$lo] && $target <= $a[$hi]) {
        if ($a[$hi] === $a[$lo]) {
            return $a[$lo] === $target ? $lo : -1;
        }
        $pos = $lo + intdiv(($target - $a[$lo]) * ($hi - $lo), $a[$hi] - $a[$lo]);
        if ($a[$pos] === $target) {
            return $pos;
        }
        $a[$pos] < $target ? $lo = $pos + 1 : $hi = $pos - 1;
    }
    return -1;
}

$a = [10, 12, 13, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47];
echo interpolationSearch($a, 18), ' ', interpolationSearch($a, 25), PHP_EOL;
