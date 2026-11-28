using System;
using System.Collections.Generic;

class LyndonFactorization
{
    static List<string> Duval(string s)
    {
        var res = new List<string>();
        int n = s.Length, i = 0;
        while (i < n)
        {
            int j = i + 1, k = i;
            while (j < n && s[k] <= s[j]) { k = s[k] < s[j] ? i : k + 1; j++; }
            while (i <= k) { res.Add(s.Substring(i, j - k)); i += j - k; }
        }
        return res;
    }

    static void Main() => Console.WriteLine(string.Join(" ", Duval("banana")));
}
