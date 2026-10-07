using System;

class FibonacciSearch
{
    static int Search(int[] a, int target)
    {
        int n = a.Length;
        int f2 = 0, f1 = 1, f = 1;
        while (f < n) (f2, f1, f) = (f1, f, f1 + f);
        int offset = -1;
        while (f > 1)
        {
            int i = Math.Min(offset + f2, n - 1);
            if (a[i] < target)
            {
                f = f1; f1 = f2; f2 = f - f1; offset = i;
            }
            else if (a[i] > target)
            {
                f = f2; f1 -= f2; f2 = f - f1;
            }
            else return i;
        }
        return f1 == 1 && offset + 1 < n && a[offset + 1] == target ? offset + 1 : -1;
    }

    static void Main()
    {
        int[] a = { 10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100 };
        foreach (int t in new[] { 85, 10, 100, 7 }) Console.WriteLine($"{t} -> {Search(a, t)}");
    }
}
