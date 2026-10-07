<?php

function countingSort(array $values): array
{
    if (empty($values)) {
        return [];
    }

    $max = max($values);
    $counts = array_fill(0, $max + 1, 0);
    foreach ($values as $v) {
        $counts[$v]++;
    }

    $sorted = [];
    foreach ($counts as $value => $count) {
        for ($i = 0; $i < $count; $i++) {
            $sorted[] = $value;
        }
    }

    return $sorted;
}

echo implode(',', countingSort([4, 2, 2, 8, 3, 3, 1])) . "\n";
