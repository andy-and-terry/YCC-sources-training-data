using System;
using System.Text;

class Crc8Checksum
{
    static byte Crc8(byte[] data)
    {
        byte crc = 0;
        foreach (var b in data)
        {
            crc ^= b;
            for (int i = 0; i < 8; i++)
                crc = (crc & 0x80) != 0 ? (byte)((crc << 1) ^ 0x07) : (byte)(crc << 1);
        }
        return crc;
    }

    static void Main() => Console.WriteLine(Crc8(Encoding.ASCII.GetBytes("123456789")).ToString("x2"));
}
