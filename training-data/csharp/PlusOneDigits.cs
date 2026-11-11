using System;
using System.Linq;

class PlusOneDigits
{
    static int[] PlusOne(int[] digits)
    {
        var d = (int[])digits.Clone();
        for (int i = d.Length - 1; i >= 0; i--)
        {
            if (d[i] < 9) { d[i]++; return d; }
            d[i] = 0;
        }
        return new[] { 1 }.Concat(d).ToArray();
    }

    static void Main()
    {
        Console.WriteLine(string.Join(",", PlusOne(new[] { 1, 2, 9 }))); // 1,3,0
        Console.WriteLine(string.Join(",", PlusOne(new[] { 9, 9 })));    // 1,0,0
    }
}
