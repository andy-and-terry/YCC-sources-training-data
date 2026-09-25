using System;
using System.Linq;
using System.Numerics;
using System.Text;

class BigIntegerAddition
{
    static string Add(string a, string b)
    {
        var sb = new StringBuilder();
        int i = a.Length - 1, j = b.Length - 1, carry = 0;
        while (i >= 0 || j >= 0 || carry > 0)
        {
            int s = carry + (i >= 0 ? a[i--] - '0' : 0) + (j >= 0 ? b[j--] - '0' : 0);
            sb.Insert(0, (char)('0' + s % 10));
            carry = s / 10;
        }
        return sb.ToString();
    }

    static string Multiply(string a, string b)
    {
        var res = new int[a.Length + b.Length];
        for (int i = a.Length - 1; i >= 0; i--)
            for (int j = b.Length - 1; j >= 0; j--)
            {
                int p = (a[i] - '0') * (b[j] - '0') + res[i + j + 1];
                res[i + j + 1] = p % 10;
                res[i + j] += p / 10;
            }
        string s = string.Concat(res.SkipWhile(d => d == 0));
        return s.Length == 0 ? "0" : s;
    }

    static void Main()
    {
        Console.WriteLine(Add("99999999999999999999", "1"));
        string x = "31415926535897932384626433832795", y = "27182818284590452353602874713527";
        Console.WriteLine(Multiply(x, y) == (BigInteger.Parse(x) * BigInteger.Parse(y)).ToString());
        string fact = Enumerable.Range(2, 29).Aggregate("1", (acc, k) => Multiply(acc, k.ToString()));
        Console.WriteLine($"30! = {fact}");
    }
}
