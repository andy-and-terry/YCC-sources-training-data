using System;
using System.Linq;

// Moser-de Bruijn sequence: binary digits of n read in base 4.
class MoserDeBruijn
{
    static int Moser(int n)
    {
        int result = 0, place = 1;
        for (; n > 0; n >>= 1, place *= 4)
            if ((n & 1) == 1) result += place;
        return result;
    }

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 12).Select(Moser)));
}
