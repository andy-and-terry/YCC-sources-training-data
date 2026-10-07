using System;
using System.Linq;

public static class BinaryGap
{
    public static int Compute(int n) =>
        Convert.ToString(n, 2).TrimEnd('0').Split('1').Select(s => s.Length).DefaultIfEmpty(0).Max();

    public static void Main()
    {
        foreach (var n in new[] { 9, 529, 20, 15, 1041 })
            Console.WriteLine($"{n} {Convert.ToString(n, 2)} {Compute(n)}");
    }
}
