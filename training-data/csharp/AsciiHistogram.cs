using System;
using System.Linq;

public static class AsciiHistogram
{
    public static string Render(string s, int width = 30)
    {
        var groups = s.GroupBy(c => c).OrderBy(g => g.Key).Select(g => (Key: g.Key, Count: g.Count())).ToList();
        var peak = groups.Max(g => g.Count);
        return string.Join(Environment.NewLine,
            groups.Select(g => $"{g.Key} | {new string('#', Math.Max(1, g.Count * width / peak))} {g.Count}"));
    }

    public static void Main() => Console.WriteLine(Render("theraininspainfallsmainlyontheplain"));
}
