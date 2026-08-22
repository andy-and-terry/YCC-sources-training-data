using System;

readonly struct Vector3
{
    public readonly double X, Y, Z;
    public Vector3(double x, double y, double z) { X = x; Y = y; Z = z; }
    public static Vector3 operator +(Vector3 a, Vector3 b) => new(a.X + b.X, a.Y + b.Y, a.Z + b.Z);
    public double Dot(Vector3 o) => X * o.X + Y * o.Y + Z * o.Z;
    public Vector3 Cross(Vector3 o) => new(Y * o.Z - Z * o.Y, Z * o.X - X * o.Z, X * o.Y - Y * o.X);
    public double Length() => Math.Sqrt(Dot(this));
    public override string ToString() => $"({X}, {Y}, {Z})";
}

class VectorMathDemo
{
    static void Main()
    {
        var a = new Vector3(1, 0, 0);
        var b = new Vector3(0, 1, 0);
        Console.WriteLine($"{a.Cross(b)} {a.Dot(b)} {(a + b).Length()}");
    }
}
