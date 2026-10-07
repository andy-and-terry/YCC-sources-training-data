using System;
using System.Globalization;

class DateTimeArithmeticDemo
{
    static void Main()
    {
        var d = new DateTime(2024, 1, 31, 10, 30, 0, DateTimeKind.Utc);
        Console.WriteLine(d.AddMonths(1).ToString("yyyy-MM-dd"));
        Console.WriteLine(d.AddDays(30).DayOfWeek);
        Console.WriteLine(DateTime.DaysInMonth(2024, 2));
        Console.WriteLine(DateTime.IsLeapYear(2100));

        TimeSpan span = new DateTime(2024, 12, 25) - new DateTime(2024, 1, 1);
        Console.WriteLine(span.TotalDays);
        Console.WriteLine(span.ToString(@"d\.hh\:mm"));

        var parsed = DateTime.ParseExact("15/03/2024", "dd/MM/yyyy", CultureInfo.InvariantCulture);
        Console.WriteLine(parsed.ToString("o", CultureInfo.InvariantCulture));
        Console.WriteLine(new DateTimeOffset(d).ToUnixTimeSeconds());
    }
}
