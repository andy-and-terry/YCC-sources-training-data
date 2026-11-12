using System;
class Pub {
    public event Action<string> Msg;
    public void Fire(string s) => Msg?.Invoke(s);
}
class Program {
    static void Main() {
        var p = new Pub();
        p.Msg += s => Console.WriteLine("A:" + s);
        p.Msg += s => Console.WriteLine("B:" + s);
        p.Fire("hi");
    }
}
