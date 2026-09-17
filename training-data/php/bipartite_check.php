<?php

function isBipartite(array $graph, string $start): bool
{
    $color = [$start => 0];
    $queue = [$start];

    while ($queue) {
        $node = array_shift($queue);
        foreach ($graph[$node] as $neighbor) {
            if (!isset($color[$neighbor])) {
                $color[$neighbor] = 1 - $color[$node];
                $queue[] = $neighbor;
            } elseif ($color[$neighbor] === $color[$node]) {
                return false;
            }
        }
    }
    return true;
}

$evenCycle = ['a' => ['b', 'd'], 'b' => ['a', 'c'], 'c' => ['b', 'd'], 'd' => ['a', 'c']];
$triangle = ['a' => ['b', 'c'], 'b' => ['a', 'c'], 'c' => ['a', 'b']];

var_dump(isBipartite($evenCycle, 'a'));
var_dump(isBipartite($triangle, 'a'));
