<?php

function partition(array &$arr, int $low, int $high): int
{
    $pivot = $arr[$high];
    $i = $low - 1;
    for ($j = $low; $j < $high; $j++) {
        if ($arr[$j] <= $pivot) {
            $i++;
            [$arr[$i], $arr[$j]] = [$arr[$j], $arr[$i]];
        }
    }
    [$arr[$i + 1], $arr[$high]] = [$arr[$high], $arr[$i + 1]];
    return $i + 1;
}

function quicksortInPlace(array &$arr, int $low, int $high): void
{
    if ($low < $high) {
        $pi = partition($arr, $low, $high);
        quicksortInPlace($arr, $low, $pi - 1);
        quicksortInPlace($arr, $pi + 1, $high);
    }
}

$data = [9, 3, 7, 1, 8, 2, 5];
quicksortInPlace($data, 0, count($data) - 1);
echo implode(',', $data) . "\n";
