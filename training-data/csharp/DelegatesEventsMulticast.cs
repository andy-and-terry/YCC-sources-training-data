using System;

class Button
{
    public event EventHandler<string>? Clicked;
    public void Click(string who) => Clicked?.Invoke(this, who);
}

class DelegatesEventsMulticast
{
    delegate int BinOp(int a, int b);

    static void Main()
    {
        var b = new Button();
        b.Clicked += (s, w) => Console.WriteLine("first " + w);
        b.Clicked += (s, w) => Console.WriteLine("second " + w);
        b.Click("ada");
        BinOp add = (x, y) => x + y;
        add += (x, y) => x * y;
        Console.WriteLine(add(3, 4) + " " + add.GetInvocationList().Length);
        Func<int, Func<int, int>> curried = x => y => x + y;
        Console.WriteLine(curried(2)(3));
    }
}
