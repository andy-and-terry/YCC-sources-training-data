using System;

class NullableValueTypeDemo
{
    static int? ParseOrNull(string s) => int.TryParse(s, out var n) ? n : null;

    static void Main()
    {
        int? a = ParseOrNull("42");
        int? b = ParseOrNull("abc");

        Console.WriteLine(a.HasValue);
        Console.WriteLine(b.HasValue);
        Console.WriteLine(a.GetValueOrDefault());
        Console.WriteLine(b ?? -1);
        Console.WriteLine(a + 1);
        Console.WriteLine(b + 1 is null);
        Console.WriteLine(a > 10);
        Console.WriteLine(b > 10);
    }
}
