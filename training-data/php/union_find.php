<?php

class UnionFind
{
    private array $parent;
    private array $rank;

    public function __construct(int $size)
    {
        $this->parent = range(0, $size - 1);
        $this->rank = array_fill(0, $size, 0);
    }

    public function find(int $x): int
    {
        if ($this->parent[$x] !== $x) {
            $this->parent[$x] = $this->find($this->parent[$x]);
        }
        return $this->parent[$x];
    }

    public function union(int $a, int $b): bool
    {
        $rootA = $this->find($a);
        $rootB = $this->find($b);
        if ($rootA === $rootB) {
            return false;
        }
        if ($this->rank[$rootA] < $this->rank[$rootB]) {
            [$rootA, $rootB] = [$rootB, $rootA];
        }
        $this->parent[$rootB] = $rootA;
        if ($this->rank[$rootA] === $this->rank[$rootB]) {
            $this->rank[$rootA]++;
        }
        return true;
    }
}

$uf = new UnionFind(5);
$uf->union(0, 1);
$uf->union(1, 2);
var_dump($uf->find(0) === $uf->find(2), $uf->find(0) === $uf->find(3));
