<?php

function backtrack(array $candidates, int $start, int $remaining, array $current, array &$results): void
{
    if ($remaining === 0) {
        $results[] = $current;
        return;
    }
    if ($remaining < 0) {
        return;
    }
    for ($i = $start; $i < count($candidates); $i++) {
        backtrack($candidates, $i, $remaining - $candidates[$i], [...$current, $candidates[$i]], $results);
    }
}

function combinationSum(array $candidates, int $target): array
{
    $results = [];
    backtrack($candidates, 0, $target, [], $results);
    return $results;
}

foreach (combinationSum([2, 3, 6, 7], 7) as $combo) {
    echo implode(',', $combo) . "\n";
}
