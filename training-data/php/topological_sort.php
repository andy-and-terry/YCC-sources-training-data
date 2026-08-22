<?php

function topologicalSort(int $numNodes, array $edges): array
{
    $graph = array_fill(0, $numNodes, []);
    $inDegree = array_fill(0, $numNodes, 0);
    foreach ($edges as [$u, $v]) {
        $graph[$u][] = $v;
        $inDegree[$v]++;
    }

    $queue = [];
    for ($n = 0; $n < $numNodes; $n++) {
        if ($inDegree[$n] === 0) {
            $queue[] = $n;
        }
    }

    $order = [];
    while (!empty($queue)) {
        $node = array_shift($queue);
        $order[] = $node;
        foreach ($graph[$node] as $neighbor) {
            if (--$inDegree[$neighbor] === 0) {
                $queue[] = $neighbor;
            }
        }
    }

    if (count($order) !== $numNodes) {
        throw new RuntimeException('graph has a cycle');
    }
    return $order;
}

print_r(topologicalSort(6, [[5, 2], [5, 0], [4, 0], [4, 1], [2, 3], [3, 1]]));
