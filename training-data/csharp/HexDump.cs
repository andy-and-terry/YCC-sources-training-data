using System;
using System.Linq;
using System.Text;

class HexDump
{
    static void Dump(byte[] data)
    {
        for (int off = 0; off < data.Length; off += 16)
        {
            var chunk = data.Skip(off).Take(16).ToArray();
            string hex = string.Join(" ", chunk.Select(b => b.ToString("x2")));
            string text = new string(chunk.Select(b => b >= 0x20 && b < 0x7f ? (char)b : '.').ToArray());
            Console.WriteLine($"{off:x8}  {hex,-47}  |{text}|");
        }
    }

    static void Main() => Dump(Encoding.ASCII.GetBytes("Hello, hex dump!\n\u0001\u0002 end"));
}
