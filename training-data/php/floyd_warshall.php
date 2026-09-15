<?php

const INF_DIST = PHP_INT_MAX / 2;

function floydWarshall(array $matrix): array
{
    $n = count($matrix);
    $dist = $matrix;

    for ($k = 0; $k < $n; $k++) {
        for ($i = 0; $i < $n; $i++) {
            for ($j = 0; $j < $n; $j++) {
                if ($dist[$i][$k] + $dist[$k][$j] < $dist[$i][$j]) {
                    $dist[$i][$j] = $dist[$i][$k] + $dist[$k][$j];
                }
            }
        }
    }
    return $dist;
}

$graph = [
    [0, 3, INF_DIST, 7],
    [8, 0, 2, INF_DIST],
    [5, INF_DIST, 0, 1],
    [2, INF_DIST, INF_DIST, 0],
];

foreach (floydWarshall($graph) as $row) {
    echo implode(',', array_map(fn ($v) => $v >= INF_DIST ? 'INF' : $v, $row)) . "\n";
}
