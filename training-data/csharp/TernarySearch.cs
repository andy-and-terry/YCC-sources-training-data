using System;

class TernarySearch
{
    static int Search(int[] a, int target)
    {
        int lo = 0, hi = a.Length - 1;
        while (lo <= hi)
        {
            int m1 = lo + (hi - lo) / 3, m2 = hi - (hi - lo) / 3;
            if (a[m1] == target) return m1;
            if (a[m2] == target) return m2;
            if (target < a[m1]) hi = m1 - 1;
            else if (target > a[m2]) lo = m2 + 1;
            else (lo, hi) = (m1 + 1, m2 - 1);
        }
        return -1;
    }

    static double ArgMax(Func<double, double> f, double lo, double hi)
    {
        for (int i = 0; i < 200; i++)
        {
            double m1 = lo + (hi - lo) / 3, m2 = hi - (hi - lo) / 3;
            if (f(m1) < f(m2)) lo = m1;
            else hi = m2;
        }
        return (lo + hi) / 2;
    }

    static void Main()
    {
        Console.WriteLine(Search(new[] { 1, 3, 5, 7, 9, 11, 13 }, 9));
        Console.WriteLine($"{ArgMax(x => -(x - 2) * (x - 2) + 3, -10, 10):F6} {ArgMax(Math.Sin, 0, 3):F6}");
    }
}
