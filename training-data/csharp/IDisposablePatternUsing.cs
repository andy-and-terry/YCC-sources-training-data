using System;
class Res : IDisposable {
    readonly string n;
    public Res(string n) { this.n = n; Console.WriteLine("open " + n); }
    public void Dispose() => Console.WriteLine("close " + n);
}
class Program {
    static void Main() {
        using var a = new Res("a");
        using (var b = new Res("b")) Console.WriteLine("inner");
        Console.WriteLine("end");
    }
}
