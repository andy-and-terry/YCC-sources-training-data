using System;

class GenericConstraintNew {
    static T Create<T>() where T : new() => new T();
    class Widget { public string Name = "w"; }

    static void Main() => Console.WriteLine(Create<Widget>().Name);
}
