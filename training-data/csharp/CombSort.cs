using System;

class CombSort
{
    static void Sort(int[] a)
    {
        int gap = a.Length;
        bool sorted = false;
        while (!sorted)
        {
            gap = (int)(gap / 1.3);
            if (gap <= 1)
            {
                gap = 1;
                sorted = true;
            }
            for (int i = 0; i + gap < a.Length; i++)
            {
                if (a[i] > a[i + gap])
                {
                    (a[i], a[i + gap]) = (a[i + gap], a[i]);
                    sorted = false;
                }
            }
        }
    }

    static void Main()
    {
        int[] a = { 8, 4, 1, 56, 3, -44, 23, -6, 28, 0 };
        Sort(a);
        Console.WriteLine(string.Join(" ", a));
    }
}
