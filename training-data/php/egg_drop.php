<?php

function eggDrop(int $eggs, int $floors): int
{
    $f = array_fill(0, $eggs + 1, 0);
    $moves = 0;
    while ($f[$eggs] < $floors) {
        $moves++;
        for ($e = $eggs; $e > 0; $e--) {
            $f[$e] += $f[$e - 1] + 1;
        }
    }
    return $moves;
}

foreach ([[1, 10], [2, 100], [3, 1000], [6, 10 ** 12]] as [$e, $fl]) {
    echo "$e eggs, $fl floors -> ", eggDrop($e, $fl), " drops", PHP_EOL;
}
