using System;

class ThrowExpressionDemo
{
    private readonly string _name;

    public ThrowExpressionDemo(string? name)
    {
        // throw as an expression on the right of ??
        _name = name ?? throw new ArgumentNullException(nameof(name));
    }

    public string Name => _name;

    static int Parse(string s) =>
        int.TryParse(s, out var n) ? n : throw new FormatException($"bad number: {s}");

    static string Describe(int n) => n switch
    {
        < 0 => throw new ArgumentOutOfRangeException(nameof(n)),
        0 => "zero",
        _ => "positive"
    };

    static void Main()
    {
        Console.WriteLine(new ThrowExpressionDemo("ok").Name);
        Console.WriteLine(Describe(Parse("7")));
        try { Parse("x"); } catch (FormatException e) { Console.WriteLine(e.Message); }
        try { new ThrowExpressionDemo(null); } catch (ArgumentNullException e) { Console.WriteLine(e.ParamName); }
    }
}
