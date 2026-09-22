<?php

function bellmanFord(array $edges, array $vertices, string $source): array
{
    $dist = array_fill_keys($vertices, PHP_INT_MAX);
    $dist[$source] = 0;

    for ($i = 1; $i < count($vertices); $i++) {
        foreach ($edges as [$u, $v, $w]) {
            if ($dist[$u] !== PHP_INT_MAX && $dist[$u] + $w < $dist[$v]) {
                $dist[$v] = $dist[$u] + $w;
            }
        }
    }

    foreach ($edges as [$u, $v, $w]) {
        if ($dist[$u] !== PHP_INT_MAX && $dist[$u] + $w < $dist[$v]) {
            throw new RuntimeException('graph contains a negative-weight cycle');
        }
    }

    return $dist;
}

$vertices = ['a', 'b', 'c', 'd', 'e'];
$edges = [
    ['a', 'b', -1], ['a', 'c', 4], ['b', 'c', 3],
    ['b', 'd', 2], ['b', 'e', 2], ['d', 'b', 1],
    ['d', 'c', 5], ['e', 'd', -3],
];

$dist = bellmanFord($edges, $vertices, 'a');
foreach ($dist as $vertex => $d) {
    echo "$vertex: $d\n";
}
