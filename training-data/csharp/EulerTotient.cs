using System;
using System.Linq;

class EulerTotient
{
    static long Phi(long n)
    {
        long result = n;
        for (long p = 2; p * p <= n; p++)
        {
            if (n % p != 0) continue;
            while (n % p == 0) n /= p;
            result -= result / p;
        }
        if (n > 1) result -= result / n;
        return result;
    }

    static int[] Sieve(int limit)
    {
        var t = Enumerable.Range(0, limit + 1).ToArray();
        for (int i = 2; i <= limit; i++)
            if (t[i] == i)
                for (int j = i; j <= limit; j += i) t[j] -= t[j] / i;
        return t;
    }

    static void Main()
    {
        var t = Sieve(1_000_000);
        Console.WriteLine(string.Join(" ", t.Skip(1).Take(20)));
        long sum = t.Skip(2).Sum(x => (long)x);
        Console.WriteLine($"sum phi(2..1e6) = {sum}, phi(10^12) = {Phi(1_000_000_000_000)}");
    }
}
