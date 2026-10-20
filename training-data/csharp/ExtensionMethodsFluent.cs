using System;
using System.Collections.Generic;
using System.Linq;

static class Ext
{
    public static string Truncate(this string s, int n) => s.Length <= n ? s : s[..n] + "...";
    public static IEnumerable<T> Tap<T>(this IEnumerable<T> xs, Action<T> a) { foreach (var x in xs) { a(x); yield return x; } }
    public static bool IsBetween(this int n, int lo, int hi) => n >= lo && n <= hi;
}

class ExtensionMethodsFluent
{
    static void Main()
    {
        Console.WriteLine("hello world".Truncate(5) + " " + 5.IsBetween(1, 10));
        var total = new[] { 1, 2, 3 }.Tap(x => Console.Write($"<{x}>")).Sum();
        Console.WriteLine(" " + total);
    }
}
