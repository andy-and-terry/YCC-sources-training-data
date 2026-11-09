using System;

static class StringExt {
    public static string Truncate(this string s, int n) =>
        s.Length <= n ? s : s.Substring(0, n) + "...";
}

class Program {
    static void Main() => Console.WriteLine("hello world".Truncate(5));
}
