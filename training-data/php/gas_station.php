<?php

function startStation(array $gas, array $cost): int
{
    [$total, $tank, $start] = [0, 0, 0];
    foreach ($gas as $i => $g) {
        $d = $g - $cost[$i];
        $total += $d;
        $tank += $d;
        if ($tank < 0) {
            [$start, $tank] = [$i + 1, 0];
        }
    }
    return $total < 0 ? -1 : $start;
}

echo startStation([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]), ' ', startStation([2, 3, 4], [3, 4, 3]), PHP_EOL;
