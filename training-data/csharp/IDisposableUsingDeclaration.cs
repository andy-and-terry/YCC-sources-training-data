using System;

class Resource : IDisposable
{
    public void Dispose() => Console.WriteLine("disposed");
}

class Program
{
    static void Main()
    {
        using var r = new Resource();
        Console.WriteLine("working");
    }
}
