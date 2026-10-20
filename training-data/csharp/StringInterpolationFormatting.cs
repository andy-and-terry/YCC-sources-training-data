using System;
using System.Globalization;

class StringInterpolationFormatting
{
    static void Main()
    {
        double pi = Math.PI; int n = 42; var d = new DateTime(2024, 3, 5, 14, 7, 9);
        Console.WriteLine($"{pi:F3} {n:D6} {n:X} {n,8}| {n,-8}| {1234567.891:N2} {0.256:P1}");
        Console.WriteLine($"{d:yyyy-MM-dd HH:mm} {d:dddd} {d.ToString("MMM d", CultureInfo.InvariantCulture)}");
        Console.WriteLine(string.Format("{0} {1:C}", "x", 9.5m).Length > 0);
        Console.WriteLine("""raw "quoted" text""" + " " + @"verbatim\path");
        Console.WriteLine($"{(n > 40 ? "big" : "small")} {{braces}}");
    }
}
