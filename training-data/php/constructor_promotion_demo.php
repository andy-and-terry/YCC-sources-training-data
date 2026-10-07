<?php

final class Point
{
    public function __construct(
        public readonly float $x = 0.0,
        public readonly float $y = 0.0,
    ) {}

    public function withX(float $x): static
    {
        return new static($x, $this->y);
    }

    public function distanceTo(Point $o): float
    {
        return hypot($o->x - $this->x, $o->y - $this->y);
    }
}

$p = new Point(3, 4);
echo $p->distanceTo(new Point()), "\n";
echo $p->withX(0)->x, "\n";
try {
    $p->x = 9;
} catch (Error $e) {
    echo get_class($e), ': ', $e->getMessage(), "\n";
}
