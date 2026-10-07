using System;
using System.Globalization;

class DateTimeFormattingDemo
{
    static void Main()
    {
        var date = new DateTime(2024, 3, 15, 14, 30, 5, DateTimeKind.Utc);
        var culture = CultureInfo.InvariantCulture;

        Console.WriteLine(date.ToString("yyyy-MM-dd", culture));
        Console.WriteLine(date.ToString("HH:mm:ss", culture));
        Console.WriteLine(date.ToString("dddd, MMMM d", culture));
        Console.WriteLine(date.ToString("o", culture));

        var parsed = DateTime.ParseExact("2024-12-25", "yyyy-MM-dd", culture);
        Console.WriteLine(parsed.DayOfWeek);

        var span = parsed - date;
        Console.WriteLine($"Days until: {(int)span.TotalDays}");
        Console.WriteLine(date.AddMonths(11).ToString("MMM yyyy", culture));

        Console.WriteLine(DateTime.TryParse("not a date", out _));
    }
}
