using System;
using System.Collections.Generic;

class Program {
    static IEnumerable<int> Evens(int max) {
        for (int i = 0; i <= max; i += 2) yield return i;
    }
    static void Main() {
        foreach (var e in Evens(10)) Console.Write(e + " ");
        Console.WriteLine();
    }
}
