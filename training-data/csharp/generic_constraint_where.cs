using System;

class Program {
    static T Max<T>(T a, T b) where T : IComparable<T> =>
        a.CompareTo(b) >= 0 ? a : b;
    static void Main() {
        Console.WriteLine(Max(3, 7));
        Console.WriteLine(Max("pear", "apple"));
    }
}
