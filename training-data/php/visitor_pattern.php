<?php

interface ShapeVisitor
{
    public function visitCircle(Circle $circle): float;
    public function visitRectangle(Rectangle $rectangle): float;
}

interface Shape
{
    public function accept(ShapeVisitor $visitor): float;
}

class Circle implements Shape
{
    public function __construct(public float $radius)
    {
    }

    public function accept(ShapeVisitor $visitor): float
    {
        return $visitor->visitCircle($this);
    }
}

class Rectangle implements Shape
{
    public function __construct(public float $width, public float $height)
    {
    }

    public function accept(ShapeVisitor $visitor): float
    {
        return $visitor->visitRectangle($this);
    }
}

class AreaVisitor implements ShapeVisitor
{
    public function visitCircle(Circle $circle): float
    {
        return M_PI * $circle->radius ** 2;
    }

    public function visitRectangle(Rectangle $rectangle): float
    {
        return $rectangle->width * $rectangle->height;
    }
}

$shapes = [new Circle(2.0), new Rectangle(3.0, 4.0)];
$visitor = new AreaVisitor();
foreach ($shapes as $shape) {
    printf("%.2f\n", $shape->accept($visitor));
}
