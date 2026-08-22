using System;

record Point(int X, int Y);
record Person(string Name, int Age, Point Location);

class RecordsWithExpression
{
    static void Main()
    {
        var alice = new Person("Alice", 30, new Point(0, 0));
        var aliceMoved = alice with { Location = new Point(5, 5) };

        Console.WriteLine(alice);
        Console.WriteLine(aliceMoved);
        Console.WriteLine(alice == aliceMoved);
        Console.WriteLine(alice.Location == new Point(0, 0));
    }
}
