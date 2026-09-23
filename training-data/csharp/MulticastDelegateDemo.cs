using System;
using System.Collections.Generic;

delegate void Notify(string message);

class MulticastDelegateDemo
{
    static List<string> history = new();

    static void LogToConsole(string message) => Console.WriteLine($"[console] {message}");
    static void LogToHistory(string message) => history.Add(message);

    static void Main()
    {
        Notify notify = LogToConsole;
        notify += LogToHistory;
        notify += message => Console.WriteLine($"[audit] {message}");

        notify("system started");
        notify("system ready");

        Console.WriteLine($"invocation list length: {notify.GetInvocationList().Length}");
        Console.WriteLine($"history: {string.Join(" | ", history)}");

        notify -= LogToHistory;
        notify("history no longer recorded");
        Console.WriteLine($"history: {string.Join(" | ", history)}");
    }
}
