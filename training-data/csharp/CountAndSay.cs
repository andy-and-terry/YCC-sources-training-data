using System;
using System.Text;

class CountAndSay
{
    static string Next(string s)
    {
        var sb = new StringBuilder();
        for (int i = 0; i < s.Length;)
        {
            int j = i;
            while (j < s.Length && s[j] == s[i]) j++;
            sb.Append(j - i).Append(s[i]);
            i = j;
        }
        return sb.ToString();
    }

    static void Main()
    {
        string s = "1";
        for (int i = 1; i <= 10; i++, s = Next(s)) Console.WriteLine($"{i,2} {s}");
    }
}
