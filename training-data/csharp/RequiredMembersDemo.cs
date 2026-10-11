using System;

class RequiredMembersDemo
{
    class User
    {
        public required string Name { get; init; }
        public required string Email { get; init; }
        public int Age { get; init; } = 18;
        public string? Nickname { get; set; }
    }

    static void Main()
    {
        var u = new User { Name = "Ada", Email = "ada@example.com" };
        Console.WriteLine($"{u.Name} <{u.Email}> age {u.Age}");

        var v = new User { Name = "Linus", Email = "l@example.com", Age = 54, Nickname = "tux" };
        Console.WriteLine($"{v.Name} aka {v.Nickname ?? "none"}");

        // var bad = new User { Name = "x" };   // compile error: Email is required
        // u.Name = "other";                    // compile error: init-only
    }
}
