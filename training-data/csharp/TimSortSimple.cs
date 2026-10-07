using System;
using System.Linq;

class TimSortSimple
{
    const int MinRun = 32;

    static void InsertionSort(int[] a, int lo, int hi)
    {
        for (int i = lo + 1; i <= hi; i++)
        {
            int key = a[i], j = i - 1;
            while (j >= lo && a[j] > key) a[j + 1] = a[j--];
            a[j + 1] = key;
        }
    }

    static void Merge(int[] a, int[] buf, int lo, int mid, int hi)
    {
        Array.Copy(a, lo, buf, lo, hi - lo + 1);
        int i = lo, j = mid + 1, k = lo;
        while (i <= mid && j <= hi) a[k++] = buf[i] <= buf[j] ? buf[i++] : buf[j++];
        while (i <= mid) a[k++] = buf[i++];
        while (j <= hi) a[k++] = buf[j++];
    }

    static void Sort(int[] a)
    {
        int n = a.Length;
        for (int lo = 0; lo < n; lo += MinRun) InsertionSort(a, lo, Math.Min(lo + MinRun - 1, n - 1));
        var buf = new int[n];
        for (int size = MinRun; size < n; size *= 2)
            for (int lo = 0; lo + size < n; lo += 2 * size)
                Merge(a, buf, lo, lo + size - 1, Math.Min(lo + 2 * size - 1, n - 1));
    }

    static void Main()
    {
        var rng = new Random(42);
        int[] a = Enumerable.Range(0, 2000).Select(_ => rng.Next(10000)).ToArray();
        int[] expected = a.OrderBy(x => x).ToArray();
        Sort(a);
        Console.WriteLine($"matches LINQ OrderBy: {a.SequenceEqual(expected)}");
    }
}
