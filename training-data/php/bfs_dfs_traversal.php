<?php

function bfs(array $graph, int $start): array
{
    $visited = [$start => true];
    $order = [];
    $queue = [$start];

    while (!empty($queue)) {
        $node = array_shift($queue);
        $order[] = $node;
        foreach ($graph[$node] as $neighbor) {
            if (!isset($visited[$neighbor])) {
                $visited[$neighbor] = true;
                $queue[] = $neighbor;
            }
        }
    }

    return $order;
}

function dfs(array $graph, int $start): array
{
    $visited = [];
    $order = [];

    $visit = function (int $node) use (&$visit, &$visited, &$order, $graph) {
        if (isset($visited[$node])) {
            return;
        }
        $visited[$node] = true;
        $order[] = $node;
        foreach ($graph[$node] as $neighbor) {
            $visit($neighbor);
        }
    };

    $visit($start);
    return $order;
}

$graph = [
    0 => [1, 2],
    1 => [0, 3],
    2 => [0, 3],
    3 => [1, 2, 4],
    4 => [3],
];

echo 'BFS: ' . implode(',', bfs($graph, 0)) . "\n";
echo 'DFS: ' . implode(',', dfs($graph, 0)) . "\n";
