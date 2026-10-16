using System;
using System.Linq;

class EnumParseDemo
{
    enum Level { Low = 1, Medium = 5, High = 10 }

    static void Main()
    {
        Console.WriteLine(Enum.Parse<Level>("High"));
        Console.WriteLine(Enum.Parse<Level>("medium", ignoreCase: true));
        Console.WriteLine(Enum.TryParse("Extreme", out Level lvl) + " " + lvl);
        Console.WriteLine(Enum.TryParse("5", out Level fromNum) + " " + fromNum);
        Console.WriteLine(Enum.IsDefined(typeof(Level), 7));
        Console.WriteLine((int)Level.High);
        Console.WriteLine((Level)1);
        Console.WriteLine(string.Join(", ", Enum.GetNames<Level>()));
        Console.WriteLine(string.Join(", ", Enum.GetValues<Level>().Select(v => (int)v)));
        Console.WriteLine(Level.Medium.ToString("D"));
        Console.WriteLine(Level.Low < Level.High);
    }
}
