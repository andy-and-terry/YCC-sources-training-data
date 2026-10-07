<?php

function tarjanScc(int $n, array $adj): array
{
    $index = array_fill(0, $n, -1);
    $lowlink = array_fill(0, $n, 0);
    $onStack = array_fill(0, $n, false);
    $stack = [];
    $counter = 0;
    $sccs = [];

    $strongConnect = function (int $v) use (
        &$strongConnect, &$index, &$lowlink, &$onStack, &$stack, &$counter, &$sccs, $adj
    ) {
        $index[$v] = $counter;
        $lowlink[$v] = $counter;
        $counter++;
        $stack[] = $v;
        $onStack[$v] = true;

        foreach ($adj[$v] as $w) {
            if ($index[$w] === -1) {
                $strongConnect($w);
                $lowlink[$v] = min($lowlink[$v], $lowlink[$w]);
            } elseif ($onStack[$w]) {
                $lowlink[$v] = min($lowlink[$v], $index[$w]);
            }
        }

        if ($lowlink[$v] === $index[$v]) {
            $component = [];
            while (true) {
                $w = array_pop($stack);
                $onStack[$w] = false;
                $component[] = $w;
                if ($w === $v) {
                    break;
                }
            }
            $sccs[] = $component;
        }
    };

    for ($v = 0; $v < $n; $v++) {
        if ($index[$v] === -1) {
            $strongConnect($v);
        }
    }
    return $sccs;
}

$adj = [
    0 => [1],
    1 => [2],
    2 => [0],
    3 => [1, 2, 4],
    4 => [3, 5],
    5 => [2, 6],
    6 => [5],
];

foreach (tarjanScc(7, $adj) as $comp) {
    echo implode(' ', $comp) . "\n";
}
