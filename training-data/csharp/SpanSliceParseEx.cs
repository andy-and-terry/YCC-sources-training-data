using System;

class Program
{
    static void Main()
    {
        ReadOnlySpan<char> line = "key=value".AsSpan();
        int i = line.IndexOf('=');
        var key = line[..i];
        var val = line[(i + 1)..];
        Console.WriteLine($"{key.ToString()} -> {val.ToString()}");
    }
}
