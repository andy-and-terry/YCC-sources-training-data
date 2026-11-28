using System;
using System.Linq;
using System.Text;

class RailFenceCipher
{
    static string Encode(string text, int rails)
    {
        var rows = Enumerable.Range(0, rails).Select(_ => new StringBuilder()).ToArray();
        int r = 0, step = 1;
        foreach (var ch in text)
        {
            rows[r].Append(ch);
            if (r == 0) step = 1; else if (r == rails - 1) step = -1;
            r += step;
        }
        return string.Concat(rows.Select(x => x.ToString()));
    }

    static void Main() => Console.WriteLine(Encode("WEAREDISCOVERED", 3));
}
