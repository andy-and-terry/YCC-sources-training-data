using System;
using System.Text;

class CaesarCipher
{
    static string Encrypt(string text, int shift)
    {
        var result = new StringBuilder();
        foreach (char ch in text)
        {
            if (char.IsLetter(ch))
            {
                char baseChar = char.IsUpper(ch) ? 'A' : 'a';
                result.Append((char)((ch - baseChar + shift % 26 + 26) % 26 + baseChar));
            }
            else
            {
                result.Append(ch);
            }
        }
        return result.ToString();
    }

    static string Decrypt(string text, int shift) => Encrypt(text, -shift);

    static void Main()
    {
        var cipher = Encrypt("Hello, World!", 3);
        Console.WriteLine(cipher);
        Console.WriteLine(Decrypt(cipher, 3));
    }
}
