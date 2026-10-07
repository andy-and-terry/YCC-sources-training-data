using System;
using System.Diagnostics;
using System.Threading;

class TimeSpanStopwatchDemo
{
    static void Main()
    {
        var ts = TimeSpan.FromMinutes(90) + TimeSpan.FromSeconds(30);
        Console.WriteLine(ts);
        Console.WriteLine(ts.TotalHours.ToString("F2"));
        Console.WriteLine($"{ts.Hours}h {ts.Minutes}m {ts.Seconds}s");
        Console.WriteLine(TimeSpan.Parse("1.02:03:04"));
        Console.WriteLine(ts.Negate().Duration() == ts);

        var sw = Stopwatch.StartNew();
        Thread.Sleep(50);
        sw.Stop();
        Console.WriteLine(sw.ElapsedMilliseconds >= 40 ? "slept at least 40ms" : "too fast?");

        sw.Restart();
        Console.WriteLine(sw.IsRunning);
        Console.WriteLine(Stopwatch.IsHighResolution);
    }
}
