using System;

static class BitReversal
{
    static byte Reverse(byte v)
    {
        int r = 0;
        for (int i = 0; i < 8; i++)
        {
            r = (r << 1) | (v & 1);
            v >>= 1;
        }
        return (byte)r;
    }

    static void Main()
    {
        foreach (byte v in new byte[] { 1, 6, 13, 128 })
            Console.WriteLine($"{v} {Reverse(v)}"); // 128 96 176 1
    }
}
