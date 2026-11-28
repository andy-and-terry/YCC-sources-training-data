using System;

class SqrtDecomposition
{
    static void Main()
    {
        int[] a = { 5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5 };
        int bs = 4;
        var blk = new int[(a.Length + bs - 1) / bs];
        for (int i = 0; i < a.Length; i++) blk[i / bs] += a[i];
        int l = 2, r = 9, sum = 0;
        for (int i = l; i <= r;)
        {
            if (i % bs == 0 && i + bs - 1 <= r) { sum += blk[i / bs]; i += bs; }
            else sum += a[i++];
        }
        Console.WriteLine($"sum[{l}..{r}] = {sum}");
    }
}
