using System;
using System.Collections.Generic;

class VarintEncode
{
    static List<byte> Varint(ulong n)
    {
        var o = new List<byte>();
        while (n >= 0x80) { o.Add((byte)((n & 0x7F) | 0x80)); n >>= 7; }
        o.Add((byte)n);
        return o;
    }

    static void Main() => Console.WriteLine(BitConverter.ToString(Varint(300).ToArray()));
}
