using System;

class SwitchExpressionPatterns
{
    static string Classify(object o) => o switch
    {
        null => "null",
        int n when n < 0 => "negative int",
        int n => $"int {n}",
        string { Length: 0 } => "empty string",
        string s => $"string {s}",
        (int x, int y) => $"pair {x},{y}",
        int[] { Length: > 2 } arr => $"big array {arr.Length}",
        _ => o.GetType().Name,
    };

    static void Main()
    {
        foreach (var o in new object[] { null, -3, 7, "", "hi", (1, 2), new[] { 1, 2, 3 }, 2.5 })
            Console.WriteLine(Classify(o));
    }
}
