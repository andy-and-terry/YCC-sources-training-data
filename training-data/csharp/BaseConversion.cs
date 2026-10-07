using System;
using System.Text;

class BaseConversion
{
    const string Digits = "0123456789abcdefghijklmnopqrstuvwxyz";

    static string ToBase(long n, int b)
    {
        if (b < 2 || b > 36) throw new ArgumentOutOfRangeException(nameof(b));
        if (n == 0) return "0";
        var sb = new StringBuilder();
        ulong v = n < 0 ? (ulong)(-(n + 1)) + 1 : (ulong)n;
        while (v > 0)
        {
            sb.Insert(0, Digits[(int)(v % (ulong)b)]);
            v /= (ulong)b;
        }
        return (n < 0 ? "-" : "") + sb;
    }

    static long FromBase(string s, int b)
    {
        bool neg = s.StartsWith('-');
        long v = 0;
        foreach (char c in neg ? s[1..] : s)
        {
            int d = Digits.IndexOf(char.ToLowerInvariant(c));
            if (d < 0 || d >= b) throw new FormatException($"bad digit '{c}'");
            v = v * b + d;
        }
        return neg ? -v : v;
    }

    static void Main()
    {
        foreach (var (n, b) in new[] { (255L, 2), (255L, 16), (-1295L, 36), (0L, 7), (long.MaxValue, 36) })
        {
            string s = ToBase(n, b);
            string lib = b is 2 or 8 or 16 ? Convert.ToString(n, b) : "n/a";
            Console.WriteLine($"{n} base {b} = {s} (Convert: {lib}, roundtrip: {FromBase(s, b) == n})");
        }
    }
}
