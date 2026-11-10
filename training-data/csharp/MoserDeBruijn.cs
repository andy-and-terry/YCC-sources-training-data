using System;
using System.Linq;

class MoserDeBruijn
{
    // Read the binary digits of i as base-4 digits.
    static long Compute(int i)
    {
        long value = 0, power = 1;
        for (; i > 0; i >>= 1)
        {
            if ((i & 1) == 1) value += power;
            power *= 4;
        }
        return value;
    }

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(Compute))); // 0 1 4 5 16 17 20 21 64 65
}
