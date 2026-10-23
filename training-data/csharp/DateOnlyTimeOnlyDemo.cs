using System;

class DateOnlyTimeOnlyDemo
{
    static void Main()
    {
        var date = new DateOnly(2024, 2, 28);
        Console.WriteLine(date.AddDays(2));
        Console.WriteLine(date.DayOfWeek);
        Console.WriteLine(DateOnly.IsLeapYear(date.Year));

        var time = new TimeOnly(22, 30);
        Console.WriteLine(time.AddHours(3));          // wraps past midnight
        Console.WriteLine(time.IsBetween(new TimeOnly(20, 0), new TimeOnly(23, 0)));

        var combined = date.ToDateTime(time);
        Console.WriteLine(combined.ToString("yyyy-MM-dd HH:mm"));

        Console.WriteLine(DateOnly.Parse("2025-01-15").ToString("MMM d, yyyy"));
    }
}
