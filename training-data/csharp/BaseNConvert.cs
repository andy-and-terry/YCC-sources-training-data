using System;

class BaseNConvert
{
    static void Main()
    {
        foreach (int b in new[] { 2, 8, 16 })
            Console.WriteLine($"255 in base {b} = {Convert.ToString(255, b)}");
        Console.WriteLine(Convert.ToInt32("ff", 16));
        Console.WriteLine(Convert.ToInt32("1010", 2));
    }
}
