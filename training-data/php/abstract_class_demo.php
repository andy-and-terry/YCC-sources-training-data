<?php

abstract class Shape
{
    abstract public function area(): float;

    public function describe(): string
    {
        return static::class . ' has area ' . round($this->area(), 2);
    }
}

class Circle extends Shape
{
    public function __construct(private float $radius)
    {
    }

    public function area(): float
    {
        return M_PI * $this->radius ** 2;
    }
}

class Rectangle extends Shape
{
    public function __construct(private float $width, private float $height)
    {
    }

    public function area(): float
    {
        return $this->width * $this->height;
    }
}

$shapes = [new Circle(2.0), new Rectangle(3.0, 4.0)];
foreach ($shapes as $shape) {
    echo $shape->describe() . "\n";
}
