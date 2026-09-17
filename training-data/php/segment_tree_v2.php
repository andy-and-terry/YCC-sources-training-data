<?php

class SegmentTree
{
    private array $tree;
    private int $n;

    public function __construct(private array $values)
    {
        $this->n = count($values);
        $this->tree = array_fill(0, 4 * max($this->n, 1), 0);
        if ($this->n > 0) {
            $this->build(1, 0, $this->n - 1);
        }
    }

    private function build(int $node, int $lo, int $hi): void
    {
        if ($lo === $hi) {
            $this->tree[$node] = $this->values[$lo];
            return;
        }
        $mid = intdiv($lo + $hi, 2);
        $this->build(2 * $node, $lo, $mid);
        $this->build(2 * $node + 1, $mid + 1, $hi);
        $this->tree[$node] = $this->tree[2 * $node] + $this->tree[2 * $node + 1];
    }

    public function update(int $index, int $value): void
    {
        $this->updateNode(1, 0, $this->n - 1, $index, $value);
    }

    private function updateNode(int $node, int $lo, int $hi, int $index, int $value): void
    {
        if ($lo === $hi) {
            $this->tree[$node] = $value;
            return;
        }
        $mid = intdiv($lo + $hi, 2);
        if ($index <= $mid) {
            $this->updateNode(2 * $node, $lo, $mid, $index, $value);
        } else {
            $this->updateNode(2 * $node + 1, $mid + 1, $hi, $index, $value);
        }
        $this->tree[$node] = $this->tree[2 * $node] + $this->tree[2 * $node + 1];
    }

    public function query(int $left, int $right): int
    {
        return $this->queryNode(1, 0, $this->n - 1, $left, $right);
    }

    private function queryNode(int $node, int $lo, int $hi, int $left, int $right): int
    {
        if ($right < $lo || $hi < $left) {
            return 0;
        }
        if ($left <= $lo && $hi <= $right) {
            return $this->tree[$node];
        }
        $mid = intdiv($lo + $hi, 2);
        return $this->queryNode(2 * $node, $lo, $mid, $left, $right)
            + $this->queryNode(2 * $node + 1, $mid + 1, $hi, $left, $right);
    }
}

$tree = new SegmentTree([1, 3, 5, 7, 9, 11]);
echo $tree->query(1, 3) . "\n";
$tree->update(1, 10);
echo $tree->query(1, 3) . "\n";
echo $tree->query(0, 5) . "\n";
