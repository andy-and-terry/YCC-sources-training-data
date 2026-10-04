using System;

class ExpensiveService
{
    public ExpensiveService()
    {
        Console.WriteLine("ExpensiveService created");
    }

    public string Query(string q) => $"result for '{q}'";
}

class LazyInitDemo
{
    private static readonly Lazy<ExpensiveService> Service =
        new(() => new ExpensiveService());

    static void Main()
    {
        Console.WriteLine("Program started");
        Console.WriteLine($"Created yet? {Service.IsValueCreated}");

        Console.WriteLine(Service.Value.Query("first"));
        Console.WriteLine(Service.Value.Query("second"));
        Console.WriteLine($"Created yet? {Service.IsValueCreated}");
    }
}
