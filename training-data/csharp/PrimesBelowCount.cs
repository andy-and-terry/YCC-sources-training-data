using System;

class PrimesBelowCount
{
    static int Count(int n)
    {
        if (n < 3) return 0;
        var composite = new bool[n];
        int count = 0;
        for (int i = 2; i < n; i++)
        {
            if (composite[i]) continue;
            count++;
            for (long j = (long)i * i; j < n; j += i) composite[j] = true;
        }
        return count;
    }

    static void Main() => Console.WriteLine(Count(100));
}
