using System;

public record Address(string Street, string City);

public record Person(string Name, int Age, Address Home)
{
    public bool IsAdult => Age >= 18;
}

public static class RecordWithExpression
{
    public static void Main()
    {
        var alice = new Person("Alice", 17, new Address("1 Main St", "Springfield"));
        var older = alice with { Age = 18 };
        var moved = older with { Home = older.Home with { City = "Shelbyville" } };

        Console.WriteLine(alice);
        Console.WriteLine($"{older.IsAdult} {alice == older} {moved.Home.City}");
        var (name, age, _) = moved;
        Console.WriteLine($"{name} is {age}");
    }
}
