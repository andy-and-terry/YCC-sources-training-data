<?php

class Point implements JsonSerializable
{
    public function __construct(private float $x, private float $y)
    {
    }

    public function jsonSerialize(): array
    {
        return ['x' => $this->x, 'y' => $this->y];
    }
}

$points = [new Point(1.0, 2.0), new Point(3.5, 4.5)];
echo json_encode($points) . "\n";
echo json_encode(['origin' => new Point(0, 0)]) . "\n";
