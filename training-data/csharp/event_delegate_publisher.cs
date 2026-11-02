using System;

class Button {
    public event Action<string>? Clicked;
    public void Click() => Clicked?.Invoke("btn1");
}

class EventDelegatePublisher {
    static void Main() {
        var b = new Button();
        b.Clicked += id => Console.WriteLine($"clicked {id}");
        b.Click();
    }
}
