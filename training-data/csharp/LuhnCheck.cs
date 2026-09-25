using System;
using System.Linq;

public static class LuhnCheck
{
    public static bool IsValid(string input)
    {
        var s = input.Replace(" ", "");
        if (s.Length < 2 || !s.All(char.IsDigit)) return false;
        var sum = s.Reverse()
            .Select((c, i) =>
            {
                var d = c - '0';
                if (i % 2 == 1) d = d * 2 > 9 ? d * 2 - 9 : d * 2;
                return d;
            })
            .Sum();
        return sum % 10 == 0;
    }

    public static void Main()
    {
        Console.WriteLine($"{IsValid("4539 3195 0343 6467")} {IsValid("8273 1232 7352 0569")}");
    }
}
