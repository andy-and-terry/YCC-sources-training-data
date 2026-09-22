<?php

function bfs(array $graph, string $start): array
{
    $visited = [$start => true];
    $queue = [$start];
    $order = [];

    while (!empty($queue)) {
        $node = array_shift($queue);
        $order[] = $node;
        foreach ($graph[$node] ?? [] as $neighbor) {
            if (!isset($visited[$neighbor])) {
                $visited[$neighbor] = true;
                $queue[] = $neighbor;
            }
        }
    }

    return $order;
}

$graph = [
    'a' => ['b', 'c'],
    'b' => ['a', 'd'],
    'c' => ['a', 'd'],
    'd' => ['b', 'c', 'e'],
    'e' => ['d'],
];

echo implode(' -> ', bfs($graph, 'a')) . "\n";
