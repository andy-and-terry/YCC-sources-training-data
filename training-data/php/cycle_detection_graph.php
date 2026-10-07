<?php

// DFS with three colors: WHITE (unvisited), GRAY (on the current path)
// and BLACK (fully explored). Reaching a GRAY node is a back edge, i.e.
// a cycle, in a directed graph.
function hasCycle(array $graph): bool
{
    $color = [];
    foreach (array_keys($graph) as $node) {
        $color[$node] = 'white';
    }

    foreach (array_keys($graph) as $node) {
        if ($color[$node] === 'white' && dfsVisit($node, $graph, $color)) {
            return true;
        }
    }
    return false;
}

function dfsVisit(string $node, array $graph, array &$color): bool
{
    $color[$node] = 'gray';
    foreach ($graph[$node] as $neighbor) {
        if ($color[$neighbor] === 'gray') {
            return true;
        }
        if ($color[$neighbor] === 'white' && dfsVisit($neighbor, $graph, $color)) {
            return true;
        }
    }
    $color[$node] = 'black';
    return false;
}

$cyclic = ['a' => ['b'], 'b' => ['c'], 'c' => ['a']];
$acyclic = ['a' => ['b', 'c'], 'b' => ['d'], 'c' => ['d'], 'd' => []];

var_dump(hasCycle($cyclic));
var_dump(hasCycle($acyclic));
