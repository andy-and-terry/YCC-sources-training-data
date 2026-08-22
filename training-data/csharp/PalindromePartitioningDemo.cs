using System;
using System.Collections.Generic;

class PalindromePartitioningDemo
{
    static bool IsPalindrome(string s)
    {
        int i = 0, j = s.Length - 1;
        while (i < j) { if (s[i] != s[j]) return false; i++; j--; }
        return true;
    }

    static List<List<string>> Partition(string s)
    {
        var result = new List<List<string>>();
        var path = new List<string>();

        void Backtrack(int start)
        {
            if (start == s.Length)
            {
                result.Add(new List<string>(path));
                return;
            }
            for (int end = start + 1; end <= s.Length; end++)
            {
                var sub = s.Substring(start, end - start);
                if (IsPalindrome(sub))
                {
                    path.Add(sub);
                    Backtrack(end);
                    path.RemoveAt(path.Count - 1);
                }
            }
        }

        Backtrack(0);
        return result;
    }

    static void Main()
    {
        foreach (var group in Partition("aab")) Console.WriteLine(string.Join(",", group));
    }
}
