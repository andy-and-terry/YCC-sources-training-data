using System;
using System.Text;

class Fletcher16Checksum
{
    static ushort Fletcher16(byte[] data)
    {
        int s1 = 0, s2 = 0;
        foreach (var b in data) { s1 = (s1 + b) % 255; s2 = (s2 + s1) % 255; }
        return (ushort)((s2 << 8) | s1);
    }

    static void Main() => Console.WriteLine(Fletcher16(Encoding.ASCII.GetBytes("abcde")).ToString("x"));
}
