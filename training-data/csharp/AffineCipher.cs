using System;
using System.Linq;

class AffineCipher
{
    static int ModInverse(int a, int m) => Enumerable.Range(1, m - 1).First(x => a * x % m == 1);

    static string Affine(string s, int a, int b, bool decrypt = false)
    {
        int inv = ModInverse(a, 26);
        return new string(s.Select(ch =>
        {
            if (ch < 'A' || ch > 'Z') return ch;
            int x = ch - 'A';
            int y = decrypt ? ((inv * (x - b)) % 26 + 26) % 26 : (a * x + b) % 26;
            return (char)('A' + y);
        }).ToArray());
    }

    static void Main()
    {
        var c = Affine("AFFINE", 5, 8);
        Console.WriteLine($"{c} {Affine(c, 5, 8, true)}");
    }
}
