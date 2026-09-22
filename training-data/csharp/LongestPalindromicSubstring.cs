using System;

class LongestPalindromicSubstring
{
    static string Expand(string s, int left, int right)
    {
        while (left >= 0 && right < s.Length && s[left] == s[right])
        {
            left--;
            right++;
        }
        return s.Substring(left + 1, right - left - 1);
    }

    static string Longest(string s)
    {
        if (string.IsNullOrEmpty(s)) return "";

        string best = s.Substring(0, 1);
        for (int i = 0; i < s.Length; i++)
        {
            var odd = Expand(s, i, i);
            var even = Expand(s, i, i + 1);
            foreach (var candidate in new[] { odd, even })
            {
                if (candidate.Length > best.Length) best = candidate;
            }
        }
        return best;
    }

    static void Main()
    {
        Console.WriteLine(Longest("babad"));
        Console.WriteLine(Longest("cbbd"));
    }
}
