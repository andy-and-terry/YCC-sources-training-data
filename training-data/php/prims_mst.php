<?php

function primMst(int $numVertices, array $edges): array
{
    $adjacency = array_fill(0, $numVertices, []);
    foreach ($edges as [$u, $v, $w]) {
        $adjacency[$u][] = [$v, $w];
        $adjacency[$v][] = [$u, $w];
    }

    $inMst = array_fill(0, $numVertices, false);
    $minEdge = array_fill(0, $numVertices, PHP_INT_MAX);
    $parent = array_fill(0, $numVertices, -1);
    $minEdge[0] = 0;

    $mst = [];
    $total = 0;

    for ($count = 0; $count < $numVertices; $count++) {
        $u = -1;
        foreach ($minEdge as $vertex => $weight) {
            if (!$inMst[$vertex] && ($u === -1 || $weight < $minEdge[$u])) {
                $u = $vertex;
            }
        }

        $inMst[$u] = true;
        $total += $minEdge[$u];
        if ($parent[$u] !== -1) {
            $mst[] = [$parent[$u], $u, $minEdge[$u]];
        }

        foreach ($adjacency[$u] as [$v, $w]) {
            if (!$inMst[$v] && $w < $minEdge[$v]) {
                $minEdge[$v] = $w;
                $parent[$v] = $u;
            }
        }
    }

    return [$mst, $total];
}

$edges = [
    [0, 1, 4], [0, 2, 1], [2, 1, 2],
    [1, 3, 5], [2, 3, 8], [3, 4, 3],
];

[$mst, $total] = primMst(5, $edges);
foreach ($mst as [$u, $v, $w]) {
    echo "$u-$v:$w\n";
}
echo "total: $total\n";
