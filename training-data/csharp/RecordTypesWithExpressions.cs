using System;

record Person(string Name, int Age);
record Employee(string Name, int Age, string Dept) : Person(Name, Age);

class RecordTypesWithExpressions
{
    static void Main()
    {
        var p = new Person("Ada", 36);
        var q = p with { Age = 37 };
        Console.WriteLine($"{p} {q} {p == q}");
        Console.WriteLine(new Employee("Bo", 30, "eng"));
        var (n, a) = p;
        Console.WriteLine($"{n} {a}");
    }
}
