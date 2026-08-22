using System;

interface IShape
{
    double Area();
}

class CircleShape : IShape
{
    private readonly double radius;
    public CircleShape(double radius) => this.radius = radius;
    public double Area() => Math.PI * radius * radius;
}

class SquareShape : IShape
{
    private readonly double side;
    public SquareShape(double side) => this.side = side;
    public double Area() => side * side;
}

class FactoryPatternDemo
{
    static IShape ShapeFactory(string kind, double param) => kind switch
    {
        "circle" => new CircleShape(param),
        "square" => new SquareShape(param),
        _ => throw new ArgumentException($"unknown shape: {kind}")
    };

    static void Main()
    {
        Console.WriteLine(ShapeFactory("circle", 2).Area());
        Console.WriteLine(ShapeFactory("square", 3).Area());
    }
}
