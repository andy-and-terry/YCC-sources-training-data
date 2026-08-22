<?php

function insertionSort(array $items): array
{
    $arr = $items;
    for ($i = 1; $i < count($arr); $i++) {
        $key = $arr[$i];
        $j = $i - 1;
        while ($j >= 0 && $arr[$j] > $key) {
            $arr[$j + 1] = $arr[$j];
            $j--;
        }
        $arr[$j + 1] = $key;
    }
    return $arr;
}

print_r(insertionSort([5, 3, 8, 1, 9, 2]));
