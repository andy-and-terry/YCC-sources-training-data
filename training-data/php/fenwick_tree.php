<?php

class FenwickTree
{
    private array $tree;

    public function __construct(private int $size)
    {
        $this->tree = array_fill(0, $size + 1, 0);
    }

    public function update(int $index, int $delta): void
    {
        for ($i = $index + 1; $i <= $this->size; $i += $i & (-$i)) {
            $this->tree[$i] += $delta;
        }
    }

    public function prefixSum(int $index): int
    {
        $sum = 0;
        for ($i = $index + 1; $i > 0; $i -= $i & (-$i)) {
            $sum += $this->tree[$i];
        }
        return $sum;
    }

    public function rangeSum(int $left, int $right): int
    {
        return $this->prefixSum($right) - ($left > 0 ? $this->prefixSum($left - 1) : 0);
    }
}

$values = [3, 2, -1, 6, 5, 4, -3, 3, 7, 2];
$fenwick = new FenwickTree(count($values));
foreach ($values as $i => $v) {
    $fenwick->update($i, $v);
}
echo $fenwick->rangeSum(0, 9) . "\n";
echo $fenwick->rangeSum(2, 5) . "\n";
$fenwick->update(2, 10);
echo $fenwick->rangeSum(2, 5) . "\n";
