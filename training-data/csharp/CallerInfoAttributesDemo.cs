using System;
using System.Runtime.CompilerServices;

class CallerInfoAttributesDemo
{
    static void Log(string message,
        [CallerMemberName] string member = "",
        [CallerLineNumber] int line = 0,
        [CallerFilePath] string file = "")
    {
        Console.WriteLine($"{System.IO.Path.GetFileName(file)}:{line} {member}: {message}");
    }

    static void Validate(int value, [CallerArgumentExpression(nameof(value))] string expr = "")
    {
        if (value < 0) Console.WriteLine($"invalid value from expression '{expr}'");
        else Console.WriteLine($"'{expr}' = {value}");
    }

    static void DoWork() => Log("starting work");

    static void Main()
    {
        Log("hello from main");
        DoWork();
        int offset = -4;
        Validate(offset);
        Validate(2 * 21);
    }
}
