using System;
using System.Threading.Tasks;

class OddEvenSort
{
    // Each phase compares disjoint pairs, so they can run in parallel.
    static void Sort(int[] a)
    {
        bool sorted = false;
        while (!sorted)
        {
            sorted = true;
            foreach (int start in new[] { 1, 0 })
            {
                int pairs = (a.Length - start) / 2;
                int changed = 0;
                Parallel.For(0, pairs, p =>
                {
                    int i = start + 2 * p;
                    if (a[i] > a[i + 1])
                    {
                        (a[i], a[i + 1]) = (a[i + 1], a[i]);
                        changed = 1;
                    }
                });
                if (changed == 1) sorted = false;
            }
        }
    }

    static void Main()
    {
        int[] a = { 34, 2, 10, -9, 5, 3, 1, 99, -4, 0 };
        Sort(a);
        Console.WriteLine(string.Join(" ", a));
    }
}
