using System;

class JumpSearch
{
    static int Search<T>(T[] a, T target) where T : IComparable<T>
    {
        int n = a.Length;
        int step = Math.Max(1, (int)Math.Sqrt(n));
        int prev = 0;
        while (prev < n && a[Math.Min(prev + step, n) - 1].CompareTo(target) < 0) prev += step;
        for (int i = prev; i < Math.Min(prev + step, n); i++)
            if (a[i].CompareTo(target) == 0) return i;
        return -1;
    }

    static void Main()
    {
        int[] fib = { 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610 };
        Console.WriteLine($"{Search(fib, 55)} {Search(fib, 4)} {Search(new[] { "ant", "bee", "cat" }, "cat")}");
    }
}
