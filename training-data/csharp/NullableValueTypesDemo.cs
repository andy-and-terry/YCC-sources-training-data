using System;

class NullableValueTypesDemo
{
    static int? ParseOrNull(string s) => int.TryParse(s, out var n) ? n : null;

    static void Main()
    {
        int? a = 5, b = null;
        Console.WriteLine(a.HasValue + " " + b.HasValue);
        Console.WriteLine(a.GetValueOrDefault() + " " + b.GetValueOrDefault(-1));
        Console.WriteLine((a + b) is null);
        Console.WriteLine(a > b);
        Console.WriteLine(a < b);
        Console.WriteLine(b ?? 100);

        b ??= 7;
        Console.WriteLine(b);

        Console.WriteLine(ParseOrNull("12") + " " + (ParseOrNull("zz")?.ToString() ?? "n/a"));
        DateTime? when = null;
        Console.WriteLine(when?.Year.ToString() ?? "no date");
        double? d = 2.5;
        if (d is double value) Console.WriteLine(value * 2);
        Console.WriteLine(Nullable.GetUnderlyingType(typeof(int?)));
    }
}
