using System;

Console.WriteLine("hello world".ToTitle());
Console.WriteLine("abc".Repeat(3));

static class StringExt
{
    public static string ToTitle(this string s) =>
        string.Join(' ', s.Split(' ').Select(w => char.ToUpper(w[0]) + w[1..]));
    public static string Repeat(this string s, int n) => string.Concat(Enumerable.Repeat(s, n));
}
