using System;
using System.Collections.Generic;
using System.Linq;

class GenerateParentheses
{
    static IEnumerable<string> Generate(int n, string prefix = "", int open = 0, int close = 0)
    {
        if (prefix.Length == 2 * n)
        {
            yield return prefix;
            yield break;
        }
        if (open < n)
            foreach (var s in Generate(n, prefix + "(", open + 1, close)) yield return s;
        if (close < open)
            foreach (var s in Generate(n, prefix + ")", open, close + 1)) yield return s;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Generate(3)));
        Console.WriteLine($"n=9: {Generate(9).Count()}");
    }
}
