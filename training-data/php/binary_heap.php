<?php

class MinHeap
{
    private array $data = [];

    public function push(int $value): void
    {
        $this->data[] = $value;
        $i = count($this->data) - 1;
        while ($i > 0) {
            $parent = intdiv($i - 1, 2);
            if ($this->data[$parent] <= $this->data[$i]) {
                break;
            }
            [$this->data[$parent], $this->data[$i]] = [$this->data[$i], $this->data[$parent]];
            $i = $parent;
        }
    }

    public function pop(): ?int
    {
        if (empty($this->data)) {
            return null;
        }
        $top = $this->data[0];
        $last = array_pop($this->data);
        if (!empty($this->data)) {
            $this->data[0] = $last;
            $this->bubbleDown(0);
        }
        return $top;
    }

    private function bubbleDown(int $i): void
    {
        $n = count($this->data);
        while (true) {
            $left = 2 * $i + 1;
            $right = 2 * $i + 2;
            $smallest = $i;
            if ($left < $n && $this->data[$left] < $this->data[$smallest]) {
                $smallest = $left;
            }
            if ($right < $n && $this->data[$right] < $this->data[$smallest]) {
                $smallest = $right;
            }
            if ($smallest === $i) {
                break;
            }
            [$this->data[$smallest], $this->data[$i]] = [$this->data[$i], $this->data[$smallest]];
            $i = $smallest;
        }
    }
}

$heap = new MinHeap();
foreach ([5, 3, 8, 1, 9, 2] as $v) {
    $heap->push($v);
}
$sorted = [];
while (($v = $heap->pop()) !== null) {
    $sorted[] = $v;
}
echo implode(',', $sorted) . "\n";
