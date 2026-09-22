<?php

class DisjointSet
{
    private array $parent;

    public function __construct(array $nodes)
    {
        $this->parent = array_combine($nodes, $nodes);
    }

    public function find(string $x): string
    {
        if ($this->parent[$x] !== $x) {
            $this->parent[$x] = $this->find($this->parent[$x]);
        }
        return $this->parent[$x];
    }

    public function union(string $a, string $b): bool
    {
        $rootA = $this->find($a);
        $rootB = $this->find($b);
        if ($rootA === $rootB) {
            return false;
        }
        $this->parent[$rootA] = $rootB;
        return true;
    }
}

function kruskalMst(array $vertices, array $edges): array
{
    usort($edges, fn($a, $b) => $a[2] <=> $b[2]);
    $dsu = new DisjointSet($vertices);
    $mst = [];
    $total = 0;

    foreach ($edges as $edge) {
        [$u, $v, $w] = $edge;
        if ($dsu->union($u, $v)) {
            $mst[] = $edge;
            $total += $w;
        }
    }
    return [$mst, $total];
}

$vertices = ['a', 'b', 'c', 'd', 'e'];
$edges = [
    ['a', 'b', 4], ['a', 'c', 1], ['c', 'b', 2],
    ['b', 'd', 5], ['c', 'd', 8], ['d', 'e', 3],
];

[$mst, $total] = kruskalMst($vertices, $edges);
foreach ($mst as [$u, $v, $w]) {
    echo "$u-$v:$w\n";
}
echo "total: $total\n";
