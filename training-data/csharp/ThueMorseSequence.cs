using System;
using System.Numerics;
using System.Text;

// Thue-Morse: t(n) is the parity of the number of 1 bits in n
class ThueMorseSequence
{
    static void Main()
    {
        var sb = new StringBuilder();
        for (uint n = 0; n < 32; n++) sb.Append(BitOperations.PopCount(n) % 2);
        Console.WriteLine(sb);
    }
}
