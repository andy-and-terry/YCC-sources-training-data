using System;

record Person(string Name, int Age);

class RecordWithExpression {
    static void Main() {
        var a = new Person("ann", 30);
        var b = a with { Age = 31 };
        Console.WriteLine($"{a} {b} {a == b}");
    }
}
