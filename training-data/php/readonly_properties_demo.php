<?php

final class Point
{
    public function __construct(
        public readonly float $x,
        public readonly float $y,
    ) {
    }

    public function translate(float $dx, float $dy): self
    {
        return new self($this->x + $dx, $this->y + $dy);
    }

    public function __toString(): string
    {
        return "($this->x, $this->y)";
    }
}

$p1 = new Point(1.0, 2.0);
$p2 = $p1->translate(3.0, -1.0);
echo "$p1 -> $p2\n";

try {
    $p1->x = 5.0;
} catch (\Error $e) {
    echo 'error: ' . $e->getMessage() . "\n";
}
