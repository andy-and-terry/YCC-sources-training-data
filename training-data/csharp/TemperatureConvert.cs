using System;

public enum TempUnit { Celsius, Fahrenheit, Kelvin }

public static class TemperatureConvert
{
    static double ToCelsius(double v, TempUnit u) => u switch
    {
        TempUnit.Fahrenheit => (v - 32) * 5 / 9,
        TempUnit.Kelvin => v - 273.15,
        _ => v,
    };

    static double FromCelsius(double v, TempUnit u) => u switch
    {
        TempUnit.Fahrenheit => v * 9 / 5 + 32,
        TempUnit.Kelvin => v + 273.15,
        _ => v,
    };

    public static double Convert(double v, TempUnit from, TempUnit to) => FromCelsius(ToCelsius(v, from), to);

    public static void Main()
    {
        Console.WriteLine($"{Convert(100, TempUnit.Celsius, TempUnit.Fahrenheit):F2}");
        Console.WriteLine($"{Convert(212, TempUnit.Fahrenheit, TempUnit.Kelvin):F2}");
    }
}
