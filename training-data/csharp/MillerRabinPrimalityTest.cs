using System;

class MillerRabinPrimalityTest
{
    static long ModPow(long baseVal, long exp, long modulus)
    {
        long result = 1;
        baseVal %= modulus;
        while (exp > 0)
        {
            if ((exp & 1) == 1) result = result * baseVal % modulus;
            exp >>= 1;
            baseVal = baseVal * baseVal % modulus;
        }
        return result;
    }

    static bool IsProbablePrime(long n, int rounds = 5)
    {
        if (n < 2) return false;
        foreach (long p in new long[] { 2, 3, 5, 7, 11, 13 })
        {
            if (n == p) return true;
            if (n % p == 0) return false;
        }

        long d = n - 1;
        int r = 0;
        while (d % 2 == 0)
        {
            d /= 2;
            r++;
        }

        var rand = new Random(42);
        for (int i = 0; i < rounds; i++)
        {
            long a = 2 + (long)(rand.NextDouble() * (n - 3));
            long x = ModPow(a, d, n);
            if (x == 1 || x == n - 1) continue;

            bool composite = true;
            for (int j = 0; j < r - 1; j++)
            {
                x = x * x % n;
                if (x == n - 1)
                {
                    composite = false;
                    break;
                }
            }
            if (composite) return false;
        }
        return true;
    }

    static void Main()
    {
        long[] candidates = { 97, 561, 7919, 1000000007, 1000000008 };
        foreach (long n in candidates)
            Console.WriteLine($"{n}: {IsProbablePrime(n)}");
    }
}
