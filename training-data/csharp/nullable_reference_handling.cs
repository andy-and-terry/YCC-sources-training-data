#nullable enable
using System;

class NullableReferenceHandling
{
    static int Length(string? s) => s?.Length ?? 0;

    static string Greet(string? name)
    {
        if (name is null) return "Hello, stranger";
        return $"Hello, {name}";
    }

    static void Main()
    {
        Console.WriteLine(Length(null));
        Console.WriteLine(Length("abc"));
        Console.WriteLine(Greet(null));
        Console.WriteLine(Greet("Bo"));
    }
}
