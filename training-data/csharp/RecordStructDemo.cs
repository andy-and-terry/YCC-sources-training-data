using System;

record struct Point3D(double X, double Y, double Z)
{
    public double Length() => Math.Sqrt(X * X + Y * Y + Z * Z);
}

class RecordStructDemo
{
    static void Scale(Point3D p, double factor)
    {
        p.X *= factor;
        p.Y *= factor;
        p.Z *= factor;
    }

    static void Main()
    {
        var a = new Point3D(1, 2, 2);
        var b = a;
        b.X = 100;

        Console.WriteLine(a);
        Console.WriteLine(b);
        Console.WriteLine(a == b);
        Console.WriteLine(a.Length());

        Scale(a, 2);
        Console.WriteLine(a);
    }
}
