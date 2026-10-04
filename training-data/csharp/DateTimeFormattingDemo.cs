using System;
using System.Globalization;

class DateTimeFormattingDemo
{
    static void Main()
    {
        var date = new DateTime(2024, 3, 15, 14, 30, 5, DateTimeKind.Utc);
        var culture = CultureInfo.InvariantCulture;

        Console.WriteLine(date.ToString("yyyy-MM-dd", culture));
        Console.WriteLine(date.ToString("dddd, MMMM d", culture));
        Console.WriteLine(date.ToString("HH:mm:ss", culture));
        Console.WriteLine(date.ToString("o", culture));

        var next = date.AddDays(20).AddHours(-3);
        Console.WriteLine(next.ToString("u", culture));
        Console.WriteLine((next - date).TotalHours);

        var parsed = DateTime.ParseExact("2025-01-02", "yyyy-MM-dd", culture);
        Console.WriteLine(parsed.DayOfWeek);
        Console.WriteLine(DateTime.IsLeapYear(2024));
        Console.WriteLine(DateTime.DaysInMonth(2024, 2));
    }
}
