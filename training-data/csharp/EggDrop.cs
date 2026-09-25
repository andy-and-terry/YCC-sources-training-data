using System;
using System.Numerics;

class EggDrop
{
    static int MinDrops(int eggs, BigInteger floors)
    {
        var f = new BigInteger[eggs + 1];
        int moves = 0;
        while (f[eggs] < floors)
        {
            moves++;
            for (int e = eggs; e > 0; e--) f[e] += f[e - 1] + 1;
        }
        return moves;
    }

    static void Main()
    {
        Console.WriteLine($"{MinDrops(1, 10)} {MinDrops(2, 100)} {MinDrops(3, 1000)} {MinDrops(10, BigInteger.Pow(10, 20))}");
    }
}
