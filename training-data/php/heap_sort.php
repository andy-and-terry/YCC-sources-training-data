<?php

function heapify(array &$items, int $n, int $i): void
{
    $largest = $i;
    $left = 2 * $i + 1;
    $right = 2 * $i + 2;

    if ($left < $n && $items[$left] > $items[$largest]) {
        $largest = $left;
    }
    if ($right < $n && $items[$right] > $items[$largest]) {
        $largest = $right;
    }
    if ($largest !== $i) {
        [$items[$i], $items[$largest]] = [$items[$largest], $items[$i]];
        heapify($items, $n, $largest);
    }
}

function heapSort(array $items): array
{
    $n = count($items);
    for ($i = intdiv($n, 2) - 1; $i >= 0; $i--) {
        heapify($items, $n, $i);
    }
    for ($i = $n - 1; $i > 0; $i--) {
        [$items[0], $items[$i]] = [$items[$i], $items[0]];
        heapify($items, $i, 0);
    }
    return $items;
}

echo implode(',', heapSort([5, 3, 8, 1, 9, 2])) . "\n";
