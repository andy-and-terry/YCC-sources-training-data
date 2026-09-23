<?php

function permutations(array $items): array
{
    if (count($items) <= 1) {
        return [$items];
    }

    $result = [];
    foreach ($items as $i => $item) {
        $rest = $items;
        unset($rest[$i]);
        foreach (permutations(array_values($rest)) as $permutation) {
            array_unshift($permutation, $item);
            $result[] = $permutation;
        }
    }

    return $result;
}

foreach (permutations([1, 2, 3]) as $permutation) {
    echo implode(',', $permutation) . "\n";
}
echo count(permutations([1, 2, 3, 4])) . "\n";
