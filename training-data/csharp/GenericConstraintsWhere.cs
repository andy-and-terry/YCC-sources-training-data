using System;
using System.Collections.Generic;

class GenericConstraintsWhere
{
    interface IShape { double Area(); }
    class Sq : IShape { public double S; public double Area() => S * S; }

    static T Largest<T>(IEnumerable<T> xs) where T : IComparable<T>
    {
        T best = default!; bool first = true;
        foreach (var x in xs) { if (first || x.CompareTo(best) > 0) { best = x; first = false; } }
        return best;
    }

    static T Make<T>() where T : IShape, new() => new T();
    static double Total<T>(IEnumerable<T> xs) where T : struct, IConvertible { double s = 0; foreach (var x in xs) s += x.ToDouble(null); return s; }

    static void Main()
    {
        Console.WriteLine(Largest(new[] { 3, 9, 4 }) + " " + Largest(new[] { "b", "z", "a" }) + " " + Make<Sq>().Area() + " " + Total(new[] { 1, 2 }));
    }
}
