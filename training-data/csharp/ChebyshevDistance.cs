using System;
using System.Linq;

class ChebyshevDistance
{
    static int Chebyshev(int[] a, int[] b) => a.Zip(b, (x, y) => Math.Abs(x - y)).Max();

    static void Main() => Console.WriteLine(Chebyshev(new[] { 1, 2 }, new[] { 4, 6 }));
}
