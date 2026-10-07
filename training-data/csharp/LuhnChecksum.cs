using System;
using System.Linq;

class LuhnChecksum
{
    static int Sum(string digits) =>
        digits.Reverse().Select((c, i) =>
        {
            int d = c - '0';
            if (i % 2 == 1 && (d *= 2) > 9) d -= 9;
            return d;
        }).Sum();

    static bool IsValid(string input)
    {
        string s = input.Replace(" ", "");
        return s.Length > 1 && s.All(char.IsAsciiDigit) && Sum(s) % 10 == 0;
    }

    static int CheckDigit(string partial) => (10 - Sum(partial + "0") % 10) % 10;

    static void Main()
    {
        Console.WriteLine($"{IsValid("4539 3195 0343 6467")} {IsValid("8273 1232 7352 0569")} {IsValid("12a4")}");
        Console.WriteLine($"check digit for 7992739871: {CheckDigit("7992739871")}");
    }
}
