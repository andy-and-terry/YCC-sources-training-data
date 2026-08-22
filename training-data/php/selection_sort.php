<?php

function selectionSort(array $items): array
{
    $arr = $items;
    $n = count($arr);
    for ($i = 0; $i < $n; $i++) {
        $minIdx = $i;
        for ($j = $i + 1; $j < $n; $j++) {
            if ($arr[$j] < $arr[$minIdx]) {
                $minIdx = $j;
            }
        }
        [$arr[$i], $arr[$minIdx]] = [$arr[$minIdx], $arr[$i]];
    }
    return $arr;
}

print_r(selectionSort([5, 3, 8, 1, 9, 2]));
