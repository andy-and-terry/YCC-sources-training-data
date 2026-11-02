using System;
using System.Collections.Generic;

class IteratorYieldReturn {
    static IEnumerable<int> Evens(int max) {
        for (int i = 0; i <= max; i += 2) yield return i;
    }

    static void Main() => Console.WriteLine(string.Join(" ", Evens(10)));
}
