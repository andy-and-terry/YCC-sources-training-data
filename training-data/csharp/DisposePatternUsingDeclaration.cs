using System;

class Res : IDisposable
{
    private readonly string name;
    private bool disposed;
    public Res(string n) { name = n; Console.WriteLine("open " + n); }
    public void Dispose()
    {
        if (disposed) return;
        disposed = true;
        Console.WriteLine("dispose " + name);
        GC.SuppressFinalize(this);
    }
}

class DisposePatternUsingDeclaration
{
    static void Main()
    {
        using var a = new Res("a");
        using (var b = new Res("b")) Console.WriteLine("inner");
        Console.WriteLine("end of main");
    }
}
