using System;

record Person(string Name, int Age);

class Program
{
    static void Main()
    {
        var a = new Person("Ann", 30);
        var b = a with { Age = 31 };
        Console.WriteLine(a);
        Console.WriteLine(b);
        Console.WriteLine(a == b);
    }
}
