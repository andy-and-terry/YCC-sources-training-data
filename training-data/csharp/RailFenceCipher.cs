using System;
using System.Linq;

class RailFenceCipher
{
    static int[] Order(int n, int k)
    {
        int cycle = 2 * (k - 1);
        int Rail(int i) { int r = i % cycle; return r < k ? r : cycle - r; }
        return Enumerable.Range(0, n).OrderBy(Rail).ToArray(); // OrderBy is stable
    }

    static string Encrypt(string t, int k) => new string(Order(t.Length, k).Select(i => t[i]).ToArray());

    static string Decrypt(string c, int k)
    {
        var out_ = new char[c.Length];
        var idx = Order(c.Length, k);
        for (int pos = 0; pos < idx.Length; pos++) out_[idx[pos]] = c[pos];
        return new string(out_);
    }

    static void Main()
    {
        var c = Encrypt("WEAREDISCOVERED", 3);
        Console.WriteLine($"{c} {Decrypt(c, 3)}");
    }
}
