<?php

function radixSort(array $values): array
{
    if (empty($values)) {
        return [];
    }

    $max = max($values);
    for ($exp = 1; intdiv($max, $exp) > 0; $exp *= 10) {
        $values = countingSortByDigit($values, $exp);
    }

    return $values;
}

function countingSortByDigit(array $values, int $exp): array
{
    $output = array_fill(0, count($values), 0);
    $counts = array_fill(0, 10, 0);

    foreach ($values as $v) {
        $digit = intdiv($v, $exp) % 10;
        $counts[$digit]++;
    }
    for ($i = 1; $i < 10; $i++) {
        $counts[$i] += $counts[$i - 1];
    }
    for ($i = count($values) - 1; $i >= 0; $i--) {
        $digit = intdiv($values[$i], $exp) % 10;
        $output[--$counts[$digit]] = $values[$i];
    }

    return $output;
}

echo implode(',', radixSort([170, 45, 75, 90, 802, 24, 2, 66])) . "\n";
