using System;

class UsingDeclarationDemo
{
    class Resource : IDisposable
    {
        private readonly string _name;
        public Resource(string name) { _name = name; Console.WriteLine($"open {name}"); }
        public void Dispose() => Console.WriteLine($"close {_name}");
    }

    static void Work()
    {
        using var a = new Resource("A");
        using var b = new Resource("B");
        Console.WriteLine("working");
    }

    static void Main()
    {
        Work();
        using (var c = new Resource("C"))
        {
            Console.WriteLine("block scope");
        }
        Console.WriteLine("after block");
    }
}
