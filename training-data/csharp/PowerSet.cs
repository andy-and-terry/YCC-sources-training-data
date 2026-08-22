using System;
using System.Collections.Generic;

class PowerSet
{
    static List<List<int>> Compute(List<int> items)
    {
        var result = new List<List<int>> { new List<int>() };
        foreach (int item in items)
        {
            int size = result.Count;
            for (int i = 0; i < size; i++)
            {
                var subset = new List<int>(result[i]) { item };
                result.Add(subset);
            }
        }
        return result;
    }

    static void Main()
    {
        foreach (var subset in Compute(new List<int> { 1, 2, 3 }))
            Console.WriteLine("{ " + string.Join(" ", subset) + " }");
    }
}
