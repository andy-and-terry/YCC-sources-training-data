using System;

abstract record Shape;
record Circle(double Radius) : Shape;
record Rectangle(double Width, double Height) : Shape;
record Triangle(double Base, double Height) : Shape;

class PatternMatchingSwitch
{
    static double Area(Shape shape) => shape switch
    {
        Circle c => Math.PI * c.Radius * c.Radius,
        Rectangle r => r.Width * r.Height,
        Triangle t => 0.5 * t.Base * t.Height,
        _ => throw new ArgumentException("unknown shape")
    };

    static string Describe(int n) => n switch
    {
        < 0 => "negative",
        0 => "zero",
        _ when n % 2 == 0 => "positive even",
        _ => "positive odd"
    };

    static void Main()
    {
        Shape[] shapes = { new Circle(2), new Rectangle(3, 4), new Triangle(5, 6) };
        foreach (var s in shapes) Console.WriteLine(Area(s));

        foreach (int n in new[] { -5, 0, 4, 7 }) Console.WriteLine(Describe(n));
    }
}
