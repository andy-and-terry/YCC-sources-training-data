<?php

function jumpSearch(array $a, int $target): int
{
    $n = count($a);
    $step = max(1, (int) sqrt($n));
    $prev = 0;
    while ($prev < $n && $a[min($prev + $step, $n) - 1] < $target) {
        $prev += $step;
    }
    for ($i = $prev; $i < min($prev + $step, $n); $i++) {
        if ($a[$i] === $target) {
            return $i;
        }
    }
    return -1;
}

$fib = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610];
echo jumpSearch($fib, 55), ' ', jumpSearch($fib, 4), PHP_EOL;
