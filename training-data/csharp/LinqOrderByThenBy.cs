using System;
using System.Linq;

class LinqOrderByThenBy
{
    record Person(string Name, string City, int Age);

    static void Main()
    {
        var people = new[]
        {
            new Person("Ann", "Paris", 31),
            new Person("Bob", "Berlin", 25),
            new Person("Cy", "Paris", 25),
            new Person("Di", "Berlin", 40),
        };

        var sorted = people.OrderBy(p => p.City).ThenByDescending(p => p.Age);
        foreach (var p in sorted)
            Console.WriteLine($"{p.City,-7}{p.Age,3} {p.Name}");

        Console.WriteLine(string.Join(",", people.OrderByDescending(p => p.Age).ThenBy(p => p.Name).Select(p => p.Name)));
        Console.WriteLine(people.MaxBy(p => p.Age)!.Name);
        Console.WriteLine(people.MinBy(p => p.Age)!.Name);
    }
}
