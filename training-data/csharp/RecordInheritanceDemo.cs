using System;

class RecordInheritanceDemo
{
    abstract record Shape(string Name)
    {
        public abstract double Area();
    }
    record Circle(double Radius) : Shape("circle")
    {
        public override double Area() => Math.Round(Math.PI * Radius * Radius, 2);
    }
    record Rect(double W, double H) : Shape("rect")
    {
        public override double Area() => W * H;
    }

    static void Main()
    {
        Shape[] shapes = { new Circle(1), new Rect(2, 3), new Circle(1) };
        foreach (var s in shapes) Console.WriteLine($"{s.Name}: {s.Area()}");
        Console.WriteLine(shapes[0] == shapes[2]);
        Console.WriteLine(ReferenceEquals(shapes[0], shapes[2]));
        Console.WriteLine(shapes[1]);
        var bigger = (Rect)shapes[1] with { W = 10 };
        Console.WriteLine(bigger);
        var (w, h) = bigger;
        Console.WriteLine(w * h);
    }
}
