using System;
using System.Linq;

class LinqAggregateZipDemo
{
    static void Main()
    {
        var numbers = new[] { 1, 2, 3, 4, 5 };

        int sum = numbers.Aggregate((acc, n) => acc + n);
        int product = numbers.Aggregate(1, (acc, n) => acc * n);
        string joined = numbers.Aggregate("", (acc, n) => acc.Length == 0 ? $"{n}" : $"{acc},{n}");

        Console.WriteLine($"sum={sum} product={product} joined={joined}");

        var names = new[] { "Alice", "Bob", "Carol" };
        var ages = new[] { 30, 25, 35 };
        var people = names.Zip(ages, (name, age) => $"{name} is {age}");
        foreach (var p in people) Console.WriteLine(p);
    }
}
