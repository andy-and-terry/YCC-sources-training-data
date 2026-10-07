using System;
using System.Text;
using System.Text.RegularExpressions;

class StringCompression
{
    static string Compress(string s)
    {
        var sb = new StringBuilder();
        for (int i = 0; i < s.Length;)
        {
            int j = i;
            while (j < s.Length && s[j] == s[i]) j++;
            sb.Append(s[i]).Append(j - i);
            i = j;
        }
        return sb.Length < s.Length ? sb.ToString() : s;
    }

    static string Decompress(string s) =>
        Regex.Replace(s, @"(\D)(\d+)", m => new string(m.Groups[1].Value[0], int.Parse(m.Groups[2].Value)));

    static void Main()
    {
        foreach (var w in new[] { "aabcccccaaa", "abc", "zzzzzzzzzzzz" })
        {
            string c = Compress(w);
            Console.WriteLine($"{w} -> {c} (roundtrip ok: {c == w || Decompress(c) == w})");
        }
    }
}
