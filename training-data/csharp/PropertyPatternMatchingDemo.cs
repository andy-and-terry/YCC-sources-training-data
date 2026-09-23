using System;

record Address(string City, string Country);
record Customer(string Name, int Age, Address Address);

class PropertyPatternMatchingDemo
{
    static string Classify(Customer customer) => customer switch
    {
        { Age: < 18 } => "minor",
        { Address.Country: "USA", Age: >= 65 } => "US senior",
        { Address: { City: "London" } } => "London resident",
        { Name: var n } when n.StartsWith("VIP") => "VIP customer",
        _ => "standard customer",
    };

    static void Main()
    {
        var customers = new[]
        {
            new Customer("Kid", 10, new Address("Paris", "France")),
            new Customer("Grandpa", 70, new Address("Miami", "USA")),
            new Customer("Liz", 40, new Address("London", "UK")),
            new Customer("VIP Sam", 35, new Address("Berlin", "Germany")),
            new Customer("Regular", 28, new Address("Rome", "Italy")),
        };

        foreach (var c in customers) Console.WriteLine($"{c.Name}: {Classify(c)}");
    }
}
