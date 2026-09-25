<?php

function fibonacciSearch(array $a, int $target): int
{
    $n = count($a);
    [$f2, $f1, $f] = [0, 1, 1];
    while ($f < $n) {
        [$f2, $f1, $f] = [$f1, $f, $f1 + $f];
    }
    $offset = -1;
    while ($f > 1) {
        $i = min($offset + $f2, $n - 1);
        if ($a[$i] < $target) {
            [$f, $f1] = [$f1, $f2];
            $f2 = $f - $f1;
            $offset = $i;
        } elseif ($a[$i] > $target) {
            [$f, $f1] = [$f2, $f1 - $f2];
            $f2 = $f - $f1;
        } else {
            return $i;
        }
    }
    return $f1 === 1 && $offset + 1 < $n && $a[$offset + 1] === $target ? $offset + 1 : -1;
}

$a = [10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100];
foreach ([85, 10, 100, 7] as $t) {
    echo "$t -> ", fibonacciSearch($a, $t), PHP_EOL;
}
