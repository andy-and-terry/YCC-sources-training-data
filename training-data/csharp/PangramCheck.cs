using System;
using System.Linq;

public static class PangramCheck
{
    public static bool IsPangram(string s) =>
        s.ToLowerInvariant().Where(c => c >= 'a' && c <= 'z').Distinct().Count() == 26;

    public static void Main()
    {
        Console.WriteLine(IsPangram("The quick brown fox jumps over the lazy dog"));
        Console.WriteLine(IsPangram("Hello world"));
    }
}
