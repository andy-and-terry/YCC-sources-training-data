using System;

class RangesAndIndicesDemo
{
    static void Main()
    {
        int[] a = { 10, 20, 30, 40, 50, 60 };
        Console.WriteLine(a[^1]);
        Console.WriteLine(string.Join(",", a[1..3]));
        Console.WriteLine(string.Join(",", a[..2]));
        Console.WriteLine(string.Join(",", a[^2..]));

        string s = "Hello, World";
        Console.WriteLine(s[7..]);
        Range r = 2..5;
        Console.WriteLine(s[r]);
        Index last = ^3;
        Console.WriteLine(s[last]);
    }
}
