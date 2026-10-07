using System;

class LazyInitializationDemo
{
    private static readonly Lazy<string> Config = new(() =>
    {
        Console.WriteLine("Loading config...");
        return "config-value";
    });

    static void Main()
    {
        Console.WriteLine("Before access");
        Console.WriteLine(Config.IsValueCreated);
        Console.WriteLine(Config.Value);
        Console.WriteLine(Config.Value);
        Console.WriteLine(Config.IsValueCreated);
    }
}
