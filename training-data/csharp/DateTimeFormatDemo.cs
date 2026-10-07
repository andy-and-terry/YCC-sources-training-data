using System;
using System.Globalization;

class DateTimeFormatDemo
{
    static void Main()
    {
        var d = new DateTime(2024, 2, 28, 14, 5, 9, DateTimeKind.Utc);

        Console.WriteLine(d.ToString("yyyy-MM-dd HH:mm:ss"));
        Console.WriteLine(d.ToString("dddd, MMM d", CultureInfo.InvariantCulture));
        Console.WriteLine(d.ToString("o"));
        Console.WriteLine(d.AddDays(2).ToString("yyyy-MM-dd"));
        Console.WriteLine(DateTime.IsLeapYear(d.Year));
        Console.WriteLine(DateTime.DaysInMonth(2024, 2));

        var parsed = DateTime.ParseExact("15/03/2023", "dd/MM/yyyy", CultureInfo.InvariantCulture);
        Console.WriteLine(parsed.DayOfWeek);

        TimeSpan span = d - parsed;
        Console.WriteLine($"{span.Days} days apart");

        Console.WriteLine(DateTime.TryParse("not a date", out _));
        var offset = new DateTimeOffset(d).ToOffset(TimeSpan.FromHours(9));
        Console.WriteLine(offset);
    }
}
