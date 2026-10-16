using System;

class GuidParseDemo
{
    static void Main()
    {
        var g = Guid.Parse("3f2504e0-4f89-11d3-9a0c-0305e82c3301");
        Console.WriteLine(g);
        Console.WriteLine(g.ToString("N"));
        Console.WriteLine(g.ToString("B"));
        Console.WriteLine(g.ToByteArray().Length);
        Console.WriteLine(Guid.TryParse("not-a-guid", out _));
        Console.WriteLine(Guid.Empty == default);
        Console.WriteLine(Guid.NewGuid() != Guid.NewGuid());
        Console.WriteLine(Guid.NewGuid().ToString().Length);
        Console.WriteLine(g.CompareTo(Guid.Empty) > 0);
    }
}
