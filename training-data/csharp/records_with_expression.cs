using System;

class RecordsWithExpression
{
    record Person(string Name, int Age);

    static void Main()
    {
        var p = new Person("Ann", 30);
        var q = p with { Age = 31 };
        Console.WriteLine(p);
        Console.WriteLine(q);
        Console.WriteLine(p == new Person("Ann", 30));
    }
}
