using System;
using System.Collections.Generic;

class FuncActionPredicateDemo
{
    static void Main()
    {
        Func<int, int, int> add = (a, b) => a + b;
        Func<double> pi = () => Math.PI;
        Action<string> shout = s => Console.WriteLine(s.ToUpper() + "!");
        Predicate<int> isEven = n => n % 2 == 0;
        Comparison<string> byLength = (a, b) => a.Length.CompareTo(b.Length);
        Converter<int, string> stars = n => new string('*', n);

        Console.WriteLine(add(3, 4));
        Console.WriteLine(Math.Round(pi(), 3));
        shout("hello");

        var nums = new List<int> { 1, 2, 3, 4, 5, 6 };
        Console.WriteLine(string.Join(",", nums.FindAll(isEven)));
        var words = new List<string> { "ccc", "a", "bb" };
        words.Sort(byLength);
        Console.WriteLine(string.Join(",", words));
        Console.WriteLine(string.Join(" ", nums.ConvertAll(stars).GetRange(0, 3)));

        Func<int, Func<int, int>> curriedAdd = a => b => a + b;
        Console.WriteLine(curriedAdd(10)(5));
    }
}
