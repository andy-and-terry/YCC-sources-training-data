using System;
using System.Collections.Generic;
using System.Text;

public static class LookAndSay
{
    public static string Next(string s)
    {
        var sb = new StringBuilder();
        for (var i = 0; i < s.Length;)
        {
            var j = i;
            while (j < s.Length && s[j] == s[i]) j++;
            sb.Append(j - i).Append(s[i]);
            i = j;
        }
        return sb.ToString();
    }

    public static IEnumerable<string> Sequence()
    {
        for (var s = "1"; ; s = Next(s)) yield return s;
    }

    public static void Main()
    {
        foreach (var t in System.Linq.Enumerable.Take(Sequence(), 8)) Console.WriteLine(t);
    }
}
