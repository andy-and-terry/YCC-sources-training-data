using System;
using System.Linq;

public static class CullenNumbers
{
    public static long Cullen(int n) => n * (1L << n) + 1;

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(Cullen)));
    }
}
