using System;

class DecimalRoundingDemo
{
    static void Main()
    {
        Console.WriteLine(0.1 + 0.2 == 0.3);
        Console.WriteLine(0.1m + 0.2m == 0.3m);

        decimal price = 19.995m;
        Console.WriteLine(Math.Round(price, 2));
        Console.WriteLine(Math.Round(price, 2, MidpointRounding.AwayFromZero));
        Console.WriteLine(Math.Round(2.5m) + " " + Math.Round(3.5m));
        Console.WriteLine(decimal.Floor(-1.5m) + " " + decimal.Ceiling(-1.5m) + " " + decimal.Truncate(-1.5m));

        decimal total = 0;
        for (int i = 0; i < 10; i++) total += 0.1m;
        Console.WriteLine(total == 1.0m);
        Console.WriteLine(1.00m + " " + 1.0000m);
        Console.WriteLine(decimal.Divide(10, 3));
        Console.WriteLine(decimal.MaxValue);
        Console.WriteLine((double)1.1m + " " + (decimal)1.1);
        Console.WriteLine(100m / 3m * 3m);
    }
}
