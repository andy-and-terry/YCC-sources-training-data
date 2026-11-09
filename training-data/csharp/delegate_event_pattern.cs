using System;

class Button {
    public event Action<string>? Clicked;
    public void Click() => Clicked?.Invoke("btn1");
}

class Program {
    static void Main() {
        var b = new Button();
        b.Clicked += n => Console.WriteLine($"clicked {n}");
        b.Click();
    }
}
