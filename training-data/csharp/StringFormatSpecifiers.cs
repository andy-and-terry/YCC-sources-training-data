using System;
using System.Globalization;

class StringFormatSpecifiers
{
    static void Main()
    {
        var inv = CultureInfo.InvariantCulture;
        double d = 1234567.891;
        int n = 255;

        Console.WriteLine(d.ToString("N2", inv));
        Console.WriteLine(d.ToString("F1", inv));
        Console.WriteLine(d.ToString("E3", inv));
        Console.WriteLine(0.256.ToString("P1", inv));
        Console.WriteLine(1234.5.ToString("C", inv));
        Console.WriteLine(n.ToString("X"));
        Console.WriteLine(n.ToString("x4"));
        Console.WriteLine(n.ToString("D6"));
        Console.WriteLine(Convert.ToString(n, 2));
        Console.WriteLine(7.ToString("000"));
        Console.WriteLine(1234.5678.ToString("#,0.##", inv));
        Console.WriteLine($"{n,8}|{n,-8}|{d,15:N0}");
        Console.WriteLine(string.Format(inv, "{0:0.0%}", 0.5));
    }
}
