<?php

function quicksort(array $items): array
{
    if (count($items) <= 1) {
        return $items;
    }

    $pivot = $items[intdiv(count($items), 2)];
    $left = array_values(array_filter($items, fn($x) => $x < $pivot));
    $mid = array_values(array_filter($items, fn($x) => $x === $pivot));
    $right = array_values(array_filter($items, fn($x) => $x > $pivot));

    return array_merge(quicksort($left), $mid, quicksort($right));
}

print_r(quicksort([5, 3, 8, 1, 9, 2]));
