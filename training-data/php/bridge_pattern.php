<?php

// Bridge decouples an abstraction (Shape) from its implementation
// (Renderer) so the two can vary independently: any shape can be drawn
// with any renderer without an explosion of shape/renderer subclasses.
interface Renderer
{
    public function renderCircle(float $radius): string;
}

class VectorRenderer implements Renderer
{
    public function renderCircle(float $radius): string
    {
        return "drawing a vector circle of radius {$radius}";
    }
}

class RasterRenderer implements Renderer
{
    public function renderCircle(float $radius): string
    {
        return "drawing pixels for a circle of radius {$radius}";
    }
}

abstract class Shape
{
    public function __construct(protected Renderer $renderer)
    {
    }

    abstract public function draw(): string;
}

class Circle extends Shape
{
    public function __construct(Renderer $renderer, private float $radius)
    {
        parent::__construct($renderer);
    }

    public function draw(): string
    {
        return $this->renderer->renderCircle($this->radius);
    }
}

$vectorCircle = new Circle(new VectorRenderer(), 5.0);
$rasterCircle = new Circle(new RasterRenderer(), 5.0);

echo $vectorCircle->draw(), PHP_EOL;
echo $rasterCircle->draw(), PHP_EOL;
