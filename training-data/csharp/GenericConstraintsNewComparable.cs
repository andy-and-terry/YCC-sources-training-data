using System;

class Program
{
    static T MaxOf<T>(T a, T b) where T : IComparable<T> => a.CompareTo(b) >= 0 ? a : b;
    static T Make<T>() where T : new() => new T();

    static void Main()
    {
        Console.WriteLine(MaxOf(3, 9));
        Console.WriteLine(MaxOf("pear", "apple"));
        Console.WriteLine(Make<System.Text.StringBuilder>().Append("ok"));
    }
}
