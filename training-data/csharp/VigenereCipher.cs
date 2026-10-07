using System;
using System.Linq;

class VigenereCipher
{
    readonly int[] shifts;

    VigenereCipher(string key)
    {
        shifts = key.Where(char.IsAsciiLetter).Select(c => char.ToLowerInvariant(c) - 'a').ToArray();
        if (shifts.Length == 0) throw new ArgumentException("key must contain letters", nameof(key));
    }

    string Apply(string text, int dir)
    {
        int k = 0;
        return string.Concat(text.Select(c =>
        {
            if (!char.IsAsciiLetter(c)) return c;
            char b = char.IsUpper(c) ? 'A' : 'a';
            int shifted = ((c - b + dir * shifts[k++ % shifts.Length]) % 26 + 26) % 26;
            return (char)(b + shifted);
        }));
    }

    static void Main()
    {
        var v = new VigenereCipher("LEMON");
        string c = v.Apply("Attack at dawn!", 1);
        Console.WriteLine($"{c} -> {v.Apply(c, -1)}");
    }
}
