<?php

// Simplified skip list: keeps a sorted array rather than true multi-level
// forward pointers, but exposes the same O(log n) search contract.
class SkipList
{
    private array $values = [];

    public function insert(int $value): void
    {
        $idx = 0;
        while ($idx < count($this->values) && $this->values[$idx] < $value) {
            $idx++;
        }
        array_splice($this->values, $idx, 0, [$value]);
    }

    public function contains(int $value): bool
    {
        $lo = 0;
        $hi = count($this->values) - 1;
        while ($lo <= $hi) {
            $mid = intdiv($lo + $hi, 2);
            if ($this->values[$mid] === $value) {
                return true;
            }
            if ($this->values[$mid] < $value) {
                $lo = $mid + 1;
            } else {
                $hi = $mid - 1;
            }
        }
        return false;
    }
}

$sl = new SkipList();
foreach ([9, 3, 7, 6, 12, 19] as $v) {
    $sl->insert($v);
}
var_dump($sl->contains(9));
var_dump($sl->contains(10));
