using System;
using System.Linq;

public static class HammingDistance
{
    public static int Compute(string a, string b)
    {
        if (a.Length != b.Length) throw new ArgumentException("strands must be of equal length");
        return a.Zip(b).Count(p => p.First != p.Second);
    }

    public static void Main()
    {
        Console.WriteLine(Compute("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"));
        try { Compute("AB", "A"); }
        catch (ArgumentException e) { Console.WriteLine($"error: {e.Message}"); }
    }
}
