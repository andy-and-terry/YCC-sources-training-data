using System;

class MathFunctionsDemo
{
    static void Main()
    {
        Console.WriteLine(Math.Round(2.5));
        Console.WriteLine(Math.Round(3.5));
        Console.WriteLine(Math.Round(2.5, MidpointRounding.AwayFromZero));
        Console.WriteLine(Math.Round(3.14159, 2));
        Console.WriteLine(Math.Floor(-2.5) + " " + Math.Ceiling(-2.5) + " " + Math.Truncate(-2.5));
        Console.WriteLine(Math.Pow(2, 10) + " " + Math.Sqrt(144) + " " + Math.Cbrt(27));
        Console.WriteLine(Math.Abs(-7) + " " + Math.Sign(-3.2) + " " + Math.Clamp(15, 0, 10));
        Console.WriteLine(Math.Max(3, 9) + " " + Math.Min(3, 9));
        Console.WriteLine(Math.Log(Math.E) + " " + Math.Log10(1000) + " " + Math.Log2(8));
        Console.WriteLine(Math.Round(Math.Sin(Math.PI / 6), 4));
        Console.WriteLine(Math.DivRem(17, 5, out int rem) + " rem " + rem);
        Console.WriteLine(Math.Round(Math.Atan2(1, 1) * 180 / Math.PI));
        Console.WriteLine(Math.BigMul(int.MaxValue, 2));
    }
}
