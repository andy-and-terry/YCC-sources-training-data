using System;
using System.Text;

class TextEncodingDemo
{
    static void Main()
    {
        string s = "héllo €";
        byte[] utf8 = Encoding.UTF8.GetBytes(s);
        byte[] utf16 = Encoding.Unicode.GetBytes(s);
        byte[] ascii = Encoding.ASCII.GetBytes(s);

        Console.WriteLine($"chars={s.Length} utf8={utf8.Length} utf16={utf16.Length}");
        Console.WriteLine(BitConverter.ToString(utf8));
        Console.WriteLine(Encoding.ASCII.GetString(ascii));
        Console.WriteLine(Encoding.UTF8.GetString(utf8));
        Console.WriteLine(Convert.ToBase64String(utf8));
        Console.WriteLine(Convert.ToHexString(Encoding.UTF8.GetBytes("Hi!")));
        Console.WriteLine(Encoding.UTF8.GetByteCount("€"));

        var rune = new Rune('€');
        Console.WriteLine(rune.Utf8SequenceLength);
    }
}
