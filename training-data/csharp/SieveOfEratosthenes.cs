using System;
using System.Collections.Generic;

class SieveOfEratosthenes
{
    static List<int> Sieve(int limit)
    {
        var isPrime = new bool[limit + 1];
        for (int i = 0; i <= limit; i++) isPrime[i] = true;
        if (limit >= 0) isPrime[0] = false;
        if (limit >= 1) isPrime[1] = false;
        for (int n = 2; (long)n * n <= limit; n++)
        {
            if (isPrime[n])
                for (int multiple = n * n; multiple <= limit; multiple += n) isPrime[multiple] = false;
        }
        var primes = new List<int>();
        for (int n = 0; n <= limit; n++) if (isPrime[n]) primes.Add(n);
        return primes;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Sieve(50)));
    }
}
