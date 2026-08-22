using System;
using System.Collections.Generic;

class PubSub
{
    private readonly Dictionary<string, List<Action<string>>> subscribers = new();

    public void Subscribe(string topic, Action<string> handler)
    {
        if (!subscribers.ContainsKey(topic)) subscribers[topic] = new List<Action<string>>();
        subscribers[topic].Add(handler);
    }

    public void Publish(string topic, string message)
    {
        if (subscribers.TryGetValue(topic, out var handlers))
            foreach (var handler in handlers) handler(message);
    }

    static void Main()
    {
        var bus = new PubSub();
        bus.Subscribe("news", msg => Console.WriteLine($"received: {msg}"));
        bus.Publish("news", "hello subscribers");
    }
}
