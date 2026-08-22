using System;
using System.Text;

class Base64CodecDemo
{
    static string Encode(byte[] data) => Convert.ToBase64String(data);
    static byte[] Decode(string text) => Convert.FromBase64String(text);

    static void Main()
    {
        var encoded = Encode(Encoding.UTF8.GetBytes("hello world"));
        Console.WriteLine(encoded);
        Console.WriteLine(Encoding.UTF8.GetString(Decode(encoded)));
    }
}
