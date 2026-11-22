using System;
using System.Collections.Generic;

// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
class EulerZigzagNumbers
{
    static void Main()
    {
        var row = new List<long> { 1 };
        var output = new List<long> { 1 };
        for (int i = 0; i < 9; i++)
        {
            var next = new List<long> { 0 };
            for (int j = row.Count - 1; j >= 0; j--) next.Add(next[next.Count - 1] + row[j]);
            row = next;
            output.Add(row[row.Count - 1]);
        }
        Console.WriteLine(string.Join(" ", output));
    }
}
