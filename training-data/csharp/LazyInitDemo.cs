using System;

class ExpensiveResource
{
    public ExpensiveResource()
    {
        Console.WriteLine("ExpensiveResource created");
    }

    public string Query() => "result";
}

class LazyInitDemo
{
    private static readonly Lazy<ExpensiveResource> Resource =
        new Lazy<ExpensiveResource>(() => new ExpensiveResource());

    static void Main()
    {
        Console.WriteLine("Program started");
        Console.WriteLine($"Created yet? {Resource.IsValueCreated}");
        Console.WriteLine(Resource.Value.Query());
        Console.WriteLine(Resource.Value.Query());
        Console.WriteLine($"Created yet? {Resource.IsValueCreated}");
    }
}
