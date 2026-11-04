<?php
final class MinStack {
    private array $items = [];

    public function push(int $x): void {
        $m = $this->items ? min($x, end($this->items)[1]) : $x;
        $this->items[] = [$x, $m];
    }

    public function pop(): int { return array_pop($this->items)[0]; }
    public function min(): int { return end($this->items)[1]; }
}

$s = new MinStack();
foreach ([5, 3, 7, 2] as $v) $s->push($v);
echo $s->min(), "\n";
$s->pop();
echo $s->min(), "\n";
