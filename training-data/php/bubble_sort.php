<?php

function bubbleSort(array $items): array
{
    $arr = $items;
    $n = count($arr);
    for ($i = 0; $i < $n; $i++) {
        $swapped = false;
        for ($j = 0; $j < $n - $i - 1; $j++) {
            if ($arr[$j] > $arr[$j + 1]) {
                [$arr[$j], $arr[$j + 1]] = [$arr[$j + 1], $arr[$j]];
                $swapped = true;
            }
        }
        if (!$swapped) {
            break;
        }
    }
    return $arr;
}

print_r(bubbleSort([5, 3, 8, 1, 9, 2]));
