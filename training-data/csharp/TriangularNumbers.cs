using System;
using System.Collections.Generic;

class TriangularNumbers
{
    static IEnumerable<int> Triangular(int count)
    {
        int sum = 0;
        for (int n = 1; n <= count; n++) yield return sum += n;
    }

    static void Main() => Console.WriteLine(string.Join(" ", Triangular(10)));
}
