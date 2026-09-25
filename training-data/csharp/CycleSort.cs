using System;
using System.Linq;

class CycleSort
{
    // Sorts with the minimum number of writes; returns the write count.
    static int Sort(int[] a)
    {
        int writes = 0;
        int Position(int item, int start) => start + a.Skip(start + 1).Count(x => x < item);
        for (int start = 0; start < a.Length - 1; start++)
        {
            int item = a[start];
            int pos = Position(item, start);
            if (pos == start) continue;
            while (item == a[pos]) pos++;
            (a[pos], item) = (item, a[pos]);
            writes++;
            while (pos != start)
            {
                pos = Position(item, start);
                while (item == a[pos]) pos++;
                (a[pos], item) = (item, a[pos]);
                writes++;
            }
        }
        return writes;
    }

    static void Main()
    {
        int[] a = { 1, 8, 3, 9, 10, 10, 2, 4 };
        int w = Sort(a);
        Console.WriteLine($"{string.Join(" ", a)} writes={w}");
    }
}
