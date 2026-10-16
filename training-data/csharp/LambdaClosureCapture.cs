using System;
using System.Collections.Generic;

class LambdaClosureCapture
{
    static Func<int> MakeCounter()
    {
        int count = 0;
        return () => ++count;
    }

    static void Main()
    {
        var c1 = MakeCounter();
        var c2 = MakeCounter();
        Console.WriteLine($"{c1()} {c1()} {c1()} {c2()}");

        var actions = new List<Action>();
        for (int i = 0; i < 3; i++)
            actions.Add(() => Console.Write($"for:{i} "));
        foreach (var a in actions) a();
        Console.WriteLine();

        actions.Clear();
        for (int i = 0; i < 3; i++)
        {
            int copy = i;
            actions.Add(() => Console.Write($"copy:{copy} "));
        }
        foreach (var a in actions) a();
        Console.WriteLine();

        actions.Clear();
        foreach (var s in new[] { "x", "y" })
            actions.Add(() => Console.Write($"foreach:{s} "));
        foreach (var a in actions) a();
        Console.WriteLine();
    }
}
