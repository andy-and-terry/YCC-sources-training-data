// Highest value reached by the Collatz (hailstone) sequence from n.
using System;

class HailstonePeak
{
    static long Peak(long n)
    {
        long best = n;
        while (n != 1)
        {
            n = n % 2 == 0 ? n / 2 : 3 * n + 1;
            best = Math.Max(best, n);
        }
        return best;
    }

    static void Main() => Console.WriteLine(Peak(27));
}
