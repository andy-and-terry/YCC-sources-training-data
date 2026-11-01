using System;

class Program
{
    static void Main()
    {
        int[] a = { 10, 20, 30, 40, 50 };
        Console.WriteLine(a[^1]);
        Console.WriteLine(string.Join(",", a[1..^1]));
        Console.WriteLine(string.Join(",", a[..2]));
    }
}
