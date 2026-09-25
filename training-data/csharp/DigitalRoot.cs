using System;
using System.Linq;

class DigitalRoot
{
    static ulong Iterative(ulong n)
    {
        while (n >= 10) n = (ulong)n.ToString().Sum(c => c - '0');
        return n;
    }

    static ulong Congruence(ulong n) => n == 0 ? 0 : 1 + (n - 1) % 9;

    static void Main()
    {
        foreach (ulong n in new ulong[] { 0, 16, 942, 132189, 493193, ulong.MaxValue })
            Console.WriteLine($"{n} -> {Congruence(n)} ({(Congruence(n) == Iterative(n) ? "ok" : "MISMATCH")})");
    }
}
