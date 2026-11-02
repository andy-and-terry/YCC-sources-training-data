using System;

class Resource : IDisposable {
    bool disposed;
    public void Dispose() {
        if (disposed) return;
        disposed = true;
        Console.WriteLine("released");
        GC.SuppressFinalize(this);
    }
}

class IDisposablePattern {
    static void Main() {
        using var r = new Resource();
        Console.WriteLine("using resource");
    }
}
