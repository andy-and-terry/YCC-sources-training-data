using System;

class MinWindowSubstring
{
    static string MinWindow(string s, string t)
    {
        var need = new int[128];
        foreach (char c in t) need[c]++;
        int missing = t.Length, bestL = 0, bestLen = int.MaxValue;
        for (int l = 0, r = 0; r < s.Length; r++)
        {
            if (need[s[r]]-- > 0) missing--;
            while (missing == 0)
            {
                if (r - l + 1 < bestLen) (bestL, bestLen) = (l, r - l + 1);
                if (++need[s[l++]] > 0) missing++;
            }
        }
        return bestLen == int.MaxValue ? "" : s.Substring(bestL, bestLen);
    }

    static void Main() => Console.WriteLine($"\"{MinWindow("ADOBECODEBANC", "ABC")}\" \"{MinWindow("a", "aa")}\"");
}
