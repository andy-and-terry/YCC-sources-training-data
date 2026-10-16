using System;
using System.Globalization;

class NumberParsingCulture
{
    static void Main()
    {
        var de = new CultureInfo("de-DE");
        var us = CultureInfo.InvariantCulture;

        Console.WriteLine(double.Parse("1.234,56", de));
        Console.WriteLine(double.Parse("1,234.56", us));
        Console.WriteLine(1234.56.ToString("N2", de));
        Console.WriteLine(1234.56.ToString("N2", us));

        Console.WriteLine(int.TryParse("12x", out var bad) + " " + bad);
        Console.WriteLine(int.TryParse(" 42 ", NumberStyles.Integer, us, out var ok) + " " + ok);
        Console.WriteLine(int.Parse("ff", NumberStyles.HexNumber));
        Console.WriteLine(decimal.Parse("$1,000.50", NumberStyles.Currency, us));
        Console.WriteLine(double.TryParse("NaN", NumberStyles.Float, us, out var nan) + " " + double.IsNaN(nan));
    }
}
