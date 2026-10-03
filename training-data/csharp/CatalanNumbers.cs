using System;

class CatalanNumbers
{
    static long[] Compute(int n)
    {
        var catalan = new long[n + 1];
        catalan[0] = 1;
        for (int i = 1; i <= n; i++)
        {
            catalan[i] = 0;
            for (int j = 0; j < i; j++)
                catalan[i] += catalan[j] * catalan[i - 1 - j];
        }
        return catalan;
    }

    static void Main()
    {
        var values = Compute(10);
        Console.WriteLine(string.Join(" ", values));
    }
}
