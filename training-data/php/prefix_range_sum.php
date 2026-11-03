<?php
final class RangeSum {
    private array $prefix = [0];

    public function __construct(array $values) {
        foreach ($values as $v) {
            $this->prefix[] = end($this->prefix) + $v;
        }
    }

    public function query(int $lo, int $hi): int {
        return $this->prefix[$hi] - $this->prefix[$lo];
    }
}

echo (new RangeSum([3, 1, 4, 1, 5, 9, 2, 6]))->query(2, 5), PHP_EOL;
