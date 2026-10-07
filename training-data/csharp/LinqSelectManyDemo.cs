using System;
using System.Collections.Generic;
using System.Linq;

record Order(string Customer, List<string> Items);

class LinqSelectManyDemo
{
    static void Main()
    {
        var orders = new List<Order>
        {
            new("Alice", new List<string> { "Book", "Pen" }),
            new("Bob", new List<string> { "Laptop" }),
            new("Carol", new List<string> { "Notebook", "Eraser", "Ruler" }),
        };

        IEnumerable<string> allItems = orders.SelectMany(o => o.Items);
        Console.WriteLine(string.Join(", ", allItems));

        var flattenedWithOwner = orders.SelectMany(
            o => o.Items,
            (order, item) => $"{order.Customer}: {item}");
        foreach (var line in flattenedWithOwner) Console.WriteLine(line);
    }
}
