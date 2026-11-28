<?php
final class SqrtSum {
    private array $blk;
    public function __construct(private array $a, private int $bs) {
        $this->blk = array_map('array_sum', array_chunk($a, $bs));
    }
    public function query(int $l, int $r): int {
        $s = 0;
        for ($i = $l; $i <= $r;) {
            if ($i % $this->bs === 0 && $i + $this->bs - 1 <= $r) { $s += $this->blk[intdiv($i, $this->bs)]; $i += $this->bs; }
            else $s += $this->a[$i++];
        }
        return $s;
    }
}
echo (new SqrtSum([5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4))->query(2, 9), "\n";
