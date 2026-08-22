<?php

interface Shape
{
    public function area(): float;
}

class Circle implements Shape
{
    public function __construct(private float $radius)
    {
    }

    public function area(): float
    {
        return M_PI * $this->radius ** 2;
    }
}

class Square implements Shape
{
    public function __construct(private float $side)
    {
    }

    public function area(): float
    {
        return $this->side ** 2;
    }
}

function shapeFactory(string $kind, float $param): Shape
{
    return match ($kind) {
        'circle' => new Circle($param),
        'square' => new Square($param),
        default => throw new InvalidArgumentException("unknown shape: $kind"),
    };
}

echo shapeFactory('circle', 2)->area() . "\n";
echo shapeFactory('square', 3)->area() . "\n";
