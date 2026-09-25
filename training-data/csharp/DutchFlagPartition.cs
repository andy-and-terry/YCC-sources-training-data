using System;

class DutchFlagPartition
{
    enum Color { Red, White, Blue }

    static void Sort(Color[] a)
    {
        int lo = 0, mid = 0, hi = a.Length - 1;
        while (mid <= hi)
        {
            switch (a[mid])
            {
                case Color.Red:
                    (a[lo], a[mid]) = (a[mid], a[lo]);
                    lo++;
                    mid++;
                    break;
                case Color.White:
                    mid++;
                    break;
                default:
                    (a[mid], a[hi]) = (a[hi], a[mid]);
                    hi--;
                    break;
            }
        }
    }

    static void Main()
    {
        var flags = new[] { Color.Blue, Color.Red, Color.White, Color.Blue, Color.Red, Color.White, Color.Red };
        Sort(flags);
        Console.WriteLine(string.Join(" ", flags));
    }
}
