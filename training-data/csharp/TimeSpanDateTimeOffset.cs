using System;

class TimeSpanDateTimeOffset
{
    static void Main()
    {
        var t = new TimeSpan(1, 2, 3, 4);
        Console.WriteLine($"{t} {t.TotalHours:F1} {TimeSpan.FromMinutes(90)}");
        var d = new DateTime(2024, 2, 28);
        Console.WriteLine(d.AddDays(2).ToString("yyyy-MM-dd") + " " + DateTime.IsLeapYear(2024) + " " + d.DayOfWeek + " " + (new DateTime(2024, 12, 25) - d).Days);
        var o = new DateTimeOffset(2024, 1, 1, 12, 0, 0, TimeSpan.FromHours(2));
        Console.WriteLine(o.UtcDateTime.ToString("HH:mm") + " " + o.ToUnixTimeSeconds());
        Console.WriteLine(DateTime.Parse("2024-03-05T10:00:00Z").Kind);
    }
}
