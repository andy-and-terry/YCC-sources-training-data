<?php

class SegmentTree
{
    private array $tree;
    private int $n;

    public function __construct(private array $data)
    {
        $this->n = count($data);
        $this->tree = array_fill(0, 4 * max($this->n, 1), 0);
        if ($this->n > 0) {
            $this->build(1, 0, $this->n - 1);
        }
    }

    private function build(int $node, int $lo, int $hi): void
    {
        if ($lo === $hi) {
            $this->tree[$node] = $this->data[$lo];
            return;
        }
        $mid = intdiv($lo + $hi, 2);
        $this->build(2 * $node, $lo, $mid);
        $this->build(2 * $node + 1, $mid + 1, $hi);
        $this->tree[$node] = $this->tree[2 * $node] + $this->tree[2 * $node + 1];
    }

    public function query(int $ql, int $qr): int
    {
        return $this->queryRange(1, 0, $this->n - 1, $ql, $qr);
    }

    private function queryRange(int $node, int $lo, int $hi, int $ql, int $qr): int
    {
        if ($qr < $lo || $hi < $ql) {
            return 0;
        }
        if ($ql <= $lo && $hi <= $qr) {
            return $this->tree[$node];
        }
        $mid = intdiv($lo + $hi, 2);
        return $this->queryRange(2 * $node, $lo, $mid, $ql, $qr)
             + $this->queryRange(2 * $node + 1, $mid + 1, $hi, $ql, $qr);
    }

    public function update(int $index, int $value): void
    {
        $this->updateAt(1, 0, $this->n - 1, $index, $value);
    }

    private function updateAt(int $node, int $lo, int $hi, int $index, int $value): void
    {
        if ($lo === $hi) {
            $this->tree[$node] = $value;
            return;
        }
        $mid = intdiv($lo + $hi, 2);
        if ($index <= $mid) {
            $this->updateAt(2 * $node, $lo, $mid, $index, $value);
        } else {
            $this->updateAt(2 * $node + 1, $mid + 1, $hi, $index, $value);
        }
        $this->tree[$node] = $this->tree[2 * $node] + $this->tree[2 * $node + 1];
    }
}

$tree = new SegmentTree([1, 3, 5, 7, 9, 11]);
echo $tree->query(1, 3) . "\n";
$tree->update(1, 10);
echo $tree->query(1, 3) . "\n";
