using System;

class ListPatternMatchingDemo
{
    static string Describe(int[] numbers) => numbers switch
    {
        [] => "empty",
        [var only] => $"single element: {only}",
        [var first, var second] => $"pair: {first}, {second}",
        [var first, .., var last] => $"starts with {first}, ends with {last}",
        _ => "unrecognized shape",
    };

    static bool StartsWithZero(int[] numbers) => numbers is [0, ..];

    static void Main()
    {
        Console.WriteLine(Describe(Array.Empty<int>()));
        Console.WriteLine(Describe(new[] { 7 }));
        Console.WriteLine(Describe(new[] { 1, 2 }));
        Console.WriteLine(Describe(new[] { 1, 2, 3, 4, 5 }));

        Console.WriteLine(StartsWithZero(new[] { 0, 1, 2 }));
        Console.WriteLine(StartsWithZero(new[] { 5, 1, 2 }));
    }
}
