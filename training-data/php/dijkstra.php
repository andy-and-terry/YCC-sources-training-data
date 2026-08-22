<?php

function dijkstra(array $graph, string $source): array
{
    $dist = array_fill_keys(array_keys($graph), PHP_INT_MAX);
    $dist[$source] = 0;
    $visited = [];

    while (count($visited) < count($graph)) {
        $u = null;
        $best = PHP_INT_MAX;
        foreach ($dist as $node => $d) {
            if (!isset($visited[$node]) && $d < $best) {
                $best = $d;
                $u = $node;
            }
        }
        if ($u === null) {
            break;
        }
        $visited[$u] = true;

        foreach ($graph[$u] as $neighbor => $weight) {
            $alt = $dist[$u] + $weight;
            if ($alt < $dist[$neighbor]) {
                $dist[$neighbor] = $alt;
            }
        }
    }
    return $dist;
}

$graph = [
    'A' => ['B' => 4, 'C' => 1],
    'B' => ['A' => 4, 'C' => 2, 'D' => 5],
    'C' => ['A' => 1, 'B' => 2, 'D' => 8],
    'D' => ['B' => 5, 'C' => 8],
];

foreach (dijkstra($graph, 'A') as $node => $d) {
    echo "$node: $d\n";
}
