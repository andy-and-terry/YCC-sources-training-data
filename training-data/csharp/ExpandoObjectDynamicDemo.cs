using System;
using System.Collections.Generic;
using System.Dynamic;

class ExpandoObjectDynamicDemo
{
    static void Main()
    {
        dynamic person = new ExpandoObject();
        person.Name = "Ada";
        person.Age = 36;
        person.Greet = (Func<string>)(() => $"Hi, I am {person.Name}");

        Console.WriteLine(person.Greet());

        var dict = (IDictionary<string, object>)person;
        dict["City"] = "London";
        Console.WriteLine(person.City);

        foreach (var key in dict.Keys)
            Console.WriteLine(key);

        dynamic x = 10;
        x = x + 5;
        Console.WriteLine(x);
    }
}
