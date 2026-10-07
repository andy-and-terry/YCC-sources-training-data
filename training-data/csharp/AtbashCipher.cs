using System;
using System.Linq;

public static class AtbashCipher
{
    public static string Decode(string text) =>
        new string(text.ToLowerInvariant()
            .Where(char.IsLetterOrDigit)
            .Select(c => char.IsLetter(c) ? (char)('z' - (c - 'a')) : c)
            .ToArray());

    public static string Encode(string text) =>
        string.Join(" ", Decode(text).Chunk(5).Select(ch => new string(ch)));

    public static void Main()
    {
        var e = Encode("The quick brown fox");
        Console.WriteLine($"{e} -> {Decode(e)}");
    }
}
