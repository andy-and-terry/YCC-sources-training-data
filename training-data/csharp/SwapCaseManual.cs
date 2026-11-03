using System;
using System.Linq;

class SwapCaseManual
{
    static string SwapCase(string s) =>
        new string(s.Select(c => char.IsUpper(c) ? char.ToLower(c) : char.ToUpper(c)).ToArray());

    static void Main() => Console.WriteLine(SwapCase("Hello World 42"));
}
