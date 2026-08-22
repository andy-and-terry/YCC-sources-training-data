using System;

class ManagedResource : IDisposable
{
    private bool disposed;
    public string Name { get; }

    public ManagedResource(string name)
    {
        Name = name;
        Console.WriteLine($"acquired {Name}");
    }

    public void Dispose()
    {
        if (disposed) return;
        Console.WriteLine($"released {Name}");
        disposed = true;
    }
}

class DisposablePattern
{
    static void Main()
    {
        using (var a = new ManagedResource("A"))
        using (var b = new ManagedResource("B"))
        {
            Console.WriteLine("using resources");
        }
        Console.WriteLine("after scope");
    }
}
