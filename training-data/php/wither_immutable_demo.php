<?php

final class Point
{
    public function __construct(public readonly int $x = 0, public readonly int $y = 0) {}

    public function withX(int $x): static
    {
        return new static($x, $this->y);
    }

    public function withY(int $y): static
    {
        return new static($this->x, $y);
    }
}

$p = new Point();
$q = $p->withX(3)->withY(4);
echo "p=({$p->x},{$p->y}) q=({$q->x},{$q->y})\n";

try {
    $q->x = 10;
} catch (Error $e) {
    echo $e->getMessage() . "\n";
}
