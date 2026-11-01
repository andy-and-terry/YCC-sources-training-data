using System;

class Program
{
    static string Describe(object o) => o switch
    {
        null => "null",
        int n when n < 0 => "negative int",
        int n => $"int {n}",
        string { Length: 0 } => "empty string",
        string s => $"string {s}",
        (int a, int b) => $"pair {a},{b}",
        _ => o.GetType().Name,
    };

    static void Main()
    {
        foreach (var o in new object[] { 5, -1, "", "x", (1, 2), 2.5 })
            Console.WriteLine(Describe(o));
    }
}
