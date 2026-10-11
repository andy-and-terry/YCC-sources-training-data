using System;
using System.Linq;

class LinqSetOperations
{
    static void Main()
    {
        int[] a = { 1, 2, 3, 4, 5, 5 };
        int[] b = { 4, 5, 6, 7 };

        Console.WriteLine("Union:     " + string.Join(" ", a.Union(b)));
        Console.WriteLine("Intersect: " + string.Join(" ", a.Intersect(b)));
        Console.WriteLine("Except:    " + string.Join(" ", a.Except(b)));
        Console.WriteLine("Distinct:  " + string.Join(" ", a.Distinct()));
        Console.WriteLine("Concat:    " + string.Join(" ", a.Concat(b)));
        Console.WriteLine("Equal sets: " + a.Distinct().OrderBy(x => x).SequenceEqual(new[] { 1, 2, 3, 4, 5 }));

        string[] words = { "Apple", "apple", "Banana" };
        Console.WriteLine(words.Distinct(StringComparer.OrdinalIgnoreCase).Count());
        Console.WriteLine(string.Join(" ", words.DistinctBy(w => w.Length)));
    }
}
