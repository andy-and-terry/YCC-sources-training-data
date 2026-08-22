using System;
using System.Linq;

class RemoveDuplicates
{
    static int[] RemoveDuplicatesOrdered(int[] items) => items.Distinct().ToArray();

    static void Main()
    {
        Console.WriteLine(string.Join(" ", RemoveDuplicatesOrdered(new[] { 1, 2, 2, 3, 1, 4 })));
    }
}
