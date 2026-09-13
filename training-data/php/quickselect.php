<?php

function quickselect(array $arr, int $k): int
{
    if (count($arr) === 1) {
        return $arr[0];
    }
    $pivot = $arr[intdiv(count($arr), 2)];
    $lows = array_values(array_filter($arr, fn ($x) => $x < $pivot));
    $highs = array_values(array_filter($arr, fn ($x) => $x > $pivot));
    $pivots = array_values(array_filter($arr, fn ($x) => $x === $pivot));

    if ($k < count($lows)) {
        return quickselect($lows, $k);
    }
    if ($k < count($lows) + count($pivots)) {
        return $pivot;
    }
    return quickselect($highs, $k - count($lows) - count($pivots));
}

$data = [7, 10, 4, 3, 20, 15];
echo quickselect($data, 0) . "\n";
echo quickselect($data, 2) . "\n";
echo quickselect($data, count($data) - 1) . "\n";
