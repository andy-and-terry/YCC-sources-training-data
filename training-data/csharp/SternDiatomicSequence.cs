using System;
using System.Collections.Generic;

public static class SternDiatomicSequence
{
    public static List<int> Stern(int count)
    {
        var s = new List<int> { 0, 1 };
        for (int n = 2; n < count; n++)
            s.Add(n % 2 == 0 ? s[n / 2] : s[n / 2] + s[n / 2 + 1]);
        return s.GetRange(0, count);
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Stern(20)));
    }
}
