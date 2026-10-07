using System;

class EulerTotient
{
    static int Phi(int n)
    {
        int result = n;
        for (int p = 2; p * p <= n; p++)
        {
            if (n % p == 0)
            {
                while (n % p == 0) n /= p;
                result -= result / p;
            }
        }
        if (n > 1) result -= result / n;
        return result;
    }

    static void Main()
    {
        foreach (var n in new[] { 1, 9, 36, 97 })
            Console.WriteLine($"phi({n}) = {Phi(n)}");
    }
}
