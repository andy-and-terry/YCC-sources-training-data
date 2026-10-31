using System;
using System.Linq;

public static class SelfDescribingNumbers
{
    static bool IsSelfDescribing(string s)
    {
        for (int i = 0; i < s.Length; i++)
            if (s.Count(c => c == (char)('0' + i)) != s[i] - '0') return false;
        return true;
    }

    public static void Main()
    {
        foreach (var s in new[] { "1210", "2020", "21200", "1211" })
            Console.WriteLine($"{s} {IsSelfDescribing(s)}");
    }
}
