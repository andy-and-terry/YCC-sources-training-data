using System;

class Res : IDisposable {
    public void Dispose() => Console.WriteLine("disposed");
}

class Program {
    static void Main() {
        using var r = new Res();
        Console.WriteLine("working");
    }
}
