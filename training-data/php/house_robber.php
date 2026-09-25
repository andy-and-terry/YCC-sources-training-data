<?php

function rob(array $houses): int
{
    [$take, $skip] = [0, 0];
    foreach ($houses as $h) {
        [$take, $skip] = [$skip + $h, max($take, $skip)];
    }
    return max($take, $skip);
}

function robCircle(array $houses): int
{
    if (count($houses) === 1) {
        return $houses[0];
    }
    return max(rob(array_slice($houses, 1)), rob(array_slice($houses, 0, -1)));
}

echo rob([2, 7, 9, 3, 1]), ' ', robCircle([2, 3, 2]), ' ', robCircle([1, 2, 3, 1]), PHP_EOL;
