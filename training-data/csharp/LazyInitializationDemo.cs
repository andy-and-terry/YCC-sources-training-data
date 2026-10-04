using System;

class ExpensiveResource
{
    public ExpensiveResource() => Console.WriteLine("ExpensiveResource created");
    public string Data => "payload";
}

class LazyInitializationDemo
{
    private static readonly Lazy<ExpensiveResource> Shared =
        new Lazy<ExpensiveResource>(() => new ExpensiveResource());

    static void Main()
    {
        Console.WriteLine("Before access");
        Console.WriteLine($"IsValueCreated: {Shared.IsValueCreated}");
        Console.WriteLine(Shared.Value.Data);
        Console.WriteLine(Shared.Value.Data);
        Console.WriteLine($"IsValueCreated: {Shared.IsValueCreated}");
    }
}
