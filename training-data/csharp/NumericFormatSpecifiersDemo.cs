using System;
using System.Globalization;

public static class NumericFormatSpecifiersDemo
{
    public static void Main()
    {
        var ci = CultureInfo.InvariantCulture;
        double d = 1234.5678;
        int n = 255;

        Console.WriteLine(d.ToString("F2", ci));
        Console.WriteLine(d.ToString("N1", ci));
        Console.WriteLine(d.ToString("E3", ci));
        Console.WriteLine(0.256.ToString("P1", ci));
        Console.WriteLine(n.ToString("X"));
        Console.WriteLine(n.ToString("x4"));
        Console.WriteLine(n.ToString("D6"));
        Console.WriteLine(1234567.ToString("#,##0", ci));
        Console.WriteLine($"{d:0.0}|{n,6}|{n,-6}|");
    }
}
