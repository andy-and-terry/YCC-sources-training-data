using System;
using System.Globalization;

class Temperature : IFormattable
{
    public double Celsius { get; }
    public Temperature(double c) => Celsius = c;

    public string ToString(string format, IFormatProvider provider)
    {
        return (format ?? "C") switch
        {
            "C" => Celsius.ToString("0.0", provider) + " C",
            "F" => (Celsius * 9 / 5 + 32).ToString("0.0", provider) + " F",
            "K" => (Celsius + 273.15).ToString("0.00", provider) + " K",
            _ => throw new FormatException($"Unknown format '{format}'")
        };
    }

    public override string ToString() => ToString("C", CultureInfo.InvariantCulture);
}

class FormattableToStringDemo
{
    static void Main()
    {
        var t = new Temperature(25);
        Console.WriteLine(t);
        Console.WriteLine(string.Format(CultureInfo.InvariantCulture, "{0:F}", t));
        Console.WriteLine($"{t:K}");
    }
}
