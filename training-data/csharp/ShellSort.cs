using System;

class ShellSort
{
    static int[] Sort(int[] items)
    {
        var arr = (int[])items.Clone();
        int n = arr.Length;
        for (int gap = n / 2; gap > 0; gap /= 2)
        {
            for (int i = gap; i < n; i++)
            {
                int temp = arr[i];
                int j = i;
                while (j >= gap && arr[j - gap] > temp)
                {
                    arr[j] = arr[j - gap];
                    j -= gap;
                }
                arr[j] = temp;
            }
        }
        return arr;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Sort(new[] { 5, 3, 8, 1, 9, 2 })));
    }
}
