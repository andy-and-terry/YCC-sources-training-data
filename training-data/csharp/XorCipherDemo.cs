using System;
using System.Text;

class XorCipherDemo
{
    static byte[] XorTransform(byte[] data, byte[] key)
    {
        var result = new byte[data.Length];
        for (int i = 0; i < data.Length; i++) result[i] = (byte)(data[i] ^ key[i % key.Length]);
        return result;
    }

    static void Main()
    {
        var key = Encoding.UTF8.GetBytes("secret");
        var ciphertext = XorTransform(Encoding.UTF8.GetBytes("hello world"), key);
        Console.WriteLine(Encoding.UTF8.GetString(XorTransform(ciphertext, key)));
    }
}
