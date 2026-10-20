using System;

class Settings
{
    public required string Host { get; init; }
    public int Port { get; init; } = 80;
    public string Url => $"{Host}:{Port}";
    private string? _cache;
    public string Lazy => _cache ??= Compute();
    private string Compute() { Console.WriteLine("computing"); return Host.ToUpper(); }
}

class PropertyInitRequiredInit
{
    static void Main()
    {
        var s = new Settings { Host = "localhost", Port = 8080 };
        Console.WriteLine(s.Url);
        Console.WriteLine(s.Lazy + s.Lazy);
    }
}
