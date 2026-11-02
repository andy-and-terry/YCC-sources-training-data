using System;

static class StringExt {
    public static string Truncate(this string s, int n) => s.Length <= n ? s : s[..n] + "...";
}

class ExtensionMethods {
    static void Main() => Console.WriteLine("hello world".Truncate(5));
}
