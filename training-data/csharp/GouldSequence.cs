using System;
using System.Numerics;

class GouldSequence
{
    static int Gould(uint n) => 1 << BitOperations.PopCount(n);

    static void Main()
    {
        for (uint n = 0; n < 16; n++) Console.Write(Gould(n) + " ");
        Console.WriteLine();
    }
}
