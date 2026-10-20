using System;

class NullableReferenceOperators
{
    class Node { public Node? Next; public string? Name; }

    static void Main()
    {
        Node? n = new Node { Name = "a", Next = null };
        Console.WriteLine(n?.Next?.Name ?? "none");
        string? s = null;
        s ??= "default";
        Console.WriteLine(s);
        int? maybe = null;
        Console.WriteLine(maybe.GetValueOrDefault(5) + " " + (maybe ?? -1) + " " + maybe.HasValue);
        Console.WriteLine(n!.Name!.ToUpper());
    }
}
