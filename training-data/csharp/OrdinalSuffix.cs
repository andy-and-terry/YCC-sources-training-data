using System;

class OrdinalSuffix
{
    static string Ordinal(int n) => (n % 100) switch
    {
        >= 11 and <= 13 => $"{n}th",
        _ => (n % 10) switch
        {
            1 => $"{n}st",
            2 => $"{n}nd",
            3 => $"{n}rd",
            _ => $"{n}th",
        },
    };

    static void Main()
    {
        foreach (var n in new[] { 1, 2, 3, 4, 11, 12, 13, 21, 101, 111 }) Console.Write(Ordinal(n) + " ");
        Console.WriteLine();
    }
}
