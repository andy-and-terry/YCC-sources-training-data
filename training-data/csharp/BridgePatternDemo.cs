using System;

interface IRenderer
{
    string RenderCircle(double radius);
}

class VectorRenderer : IRenderer
{
    public string RenderCircle(double radius) => $"drawing a vector circle of radius {radius}";
}

class RasterRenderer : IRenderer
{
    public string RenderCircle(double radius) => $"drawing pixels for a circle of radius {radius}";
}

abstract class Shape
{
    protected readonly IRenderer Renderer;

    protected Shape(IRenderer renderer) => Renderer = renderer;

    public abstract string Draw();
}

class Circle : Shape
{
    private readonly double _radius;

    public Circle(IRenderer renderer, double radius) : base(renderer) => _radius = radius;

    public override string Draw() => Renderer.RenderCircle(_radius);
}

class BridgePatternDemo
{
    static void Main()
    {
        Shape vectorCircle = new Circle(new VectorRenderer(), 5);
        Shape rasterCircle = new Circle(new RasterRenderer(), 5);

        Console.WriteLine(vectorCircle.Draw());
        Console.WriteLine(rasterCircle.Draw());
    }
}
