<?php

final class SparseMatrix
{
    /** @var array<int, array<int, float>> */
    private array $data = [];

    public function __construct(public readonly int $rows, public readonly int $cols)
    {
    }

    public static function fromDense(array $m): self
    {
        $s = new self(count($m), count($m[0]));
        foreach ($m as $r => $row) {
            foreach ($row as $c => $v) {
                $s->set($r, $c, $v);
            }
        }
        return $s;
    }

    public function set(int $r, int $c, float $v): void
    {
        if ($v == 0) {
            unset($this->data[$r][$c]);
        } else {
            $this->data[$r][$c] = $v;
        }
    }

    public function get(int $r, int $c): float
    {
        return $this->data[$r][$c] ?? 0.0;
    }

    public function nnz(): int
    {
        return array_sum(array_map('count', $this->data));
    }

    public function multiply(SparseMatrix $o): self
    {
        $res = new self($this->rows, $o->cols);
        foreach ($this->data as $r => $row) {
            foreach ($row as $k => $a) {
                foreach ($o->data[$k] ?? [] as $c => $b) {
                    $res->set($r, $c, $res->get($r, $c) + $a * $b);
                }
            }
        }
        return $res;
    }

    public function toDense(): array
    {
        $out = [];
        for ($r = 0; $r < $this->rows; $r++) {
            for ($c = 0; $c < $this->cols; $c++) {
                $out[$r][$c] = $this->get($r, $c);
            }
        }
        return $out;
    }
}

$a = SparseMatrix::fromDense([[1, 0, 0], [0, 0, 2], [0, 3, 0]]);
$b = SparseMatrix::fromDense([[0, 4], [5, 0], [0, 6]]);
$p = $a->multiply($b);
echo "nnz(a)={$a->nnz()} nnz(p)={$p->nnz()}", PHP_EOL;
echo json_encode($p->toDense()), PHP_EOL;
