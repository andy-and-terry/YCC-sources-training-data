using System;
using System.Text.RegularExpressions;

public static class Isbn10Validator
{
    public static bool IsValid(string isbn)
    {
        var s = isbn.Replace("-", "");
        if (!Regex.IsMatch(s, @"^\d{9}[\dX]$")) return false;
        var total = 0;
        for (var i = 0; i < 10; i++)
            total += (s[i] == 'X' ? 10 : s[i] - '0') * (10 - i);
        return total % 11 == 0;
    }

    public static void Main()
    {
        foreach (var s in new[] { "3-598-21508-8", "3-598-21507-X", "3-598-21508-9" })
            Console.WriteLine($"{s} {IsValid(s)}");
    }
}
