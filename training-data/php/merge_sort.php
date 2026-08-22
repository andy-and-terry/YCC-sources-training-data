<?php

function mergeSort(array $items): array
{
    if (count($items) <= 1) {
        return $items;
    }
    $mid = intdiv(count($items), 2);
    $left = mergeSort(array_slice($items, 0, $mid));
    $right = mergeSort(array_slice($items, $mid));
    return merge($left, $right);
}

function merge(array $left, array $right): array
{
    $result = [];
    $i = $j = 0;
    while ($i < count($left) && $j < count($right)) {
        $result[] = $left[$i] <= $right[$j] ? $left[$i++] : $right[$j++];
    }
    return array_merge($result, array_slice($left, $i), array_slice($right, $j));
}

print_r(mergeSort([5, 3, 8, 1, 9, 2]));
