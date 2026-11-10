using System;
using System.Linq;

class LazyCaterer
{
    static int Pieces(int cuts) => (cuts * cuts + cuts + 2) / 2;

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(Pieces))); // 1 2 4 7 11 16 22 29 37 46
}
