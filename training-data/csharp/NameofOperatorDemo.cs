using System;

class NameofOperatorDemo
{
    public int Age { get; set; }

    static void Validate(int age)
    {
        if (age < 0)
            throw new ArgumentOutOfRangeException(nameof(age), "must be non-negative");
    }

    static void Main()
    {
        Console.WriteLine(nameof(NameofOperatorDemo));
        Console.WriteLine(nameof(Age));
        Console.WriteLine(nameof(Console.WriteLine));
        Console.WriteLine(nameof(System.Collections.Generic.List<int>));

        try { Validate(-1); }
        catch (ArgumentOutOfRangeException e) { Console.WriteLine(e.ParamName); }
    }
}
