using System;

class TimeSpanDateMathDemo
{
    static void Main()
    {
        var start = new DateTime(2024, 1, 31, 8, 30, 0);
        var end = start.AddMonths(1).AddDays(3).AddHours(5);
        TimeSpan diff = end - start;

        Console.WriteLine($"start: {start:yyyy-MM-dd HH:mm}");
        Console.WriteLine($"end:   {end:yyyy-MM-dd HH:mm}");
        Console.WriteLine($"diff: {diff.Days}d {diff.Hours}h total {diff.TotalHours:F1}h");
        Console.WriteLine(DateTime.IsLeapYear(2024));
        Console.WriteLine(start.DayOfWeek);
        Console.WriteLine(TimeSpan.FromMinutes(135));
        Console.WriteLine(TimeSpan.Parse("01:02:03").TotalSeconds);
    }
}
