<?php

function binarySearch(array $items, int $target): int
{
    $low = 0;
    $high = count($items) - 1;
    while ($low <= $high) {
        $mid = intdiv($low + $high, 2);
        if ($items[$mid] === $target) {
            return $mid;
        }
        if ($items[$mid] < $target) {
            $low = $mid + 1;
        } else {
            $high = $mid - 1;
        }
    }
    return -1;
}

echo binarySearch([1, 2, 5, 7, 9, 11], 7) . "\n";
