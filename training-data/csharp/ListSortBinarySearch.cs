using System;
using System.Collections.Generic;

class ListSortBinarySearch
{
    static void Main()
    {
        var list = new List<int> { 42, 7, 19, 3, 88, 25 };
        list.Sort();
        Console.WriteLine(string.Join(" ", list));

        Console.WriteLine(list.BinarySearch(19));
        int missing = list.BinarySearch(20);
        Console.WriteLine(missing);
        Console.WriteLine("insert at " + ~missing);
        list.Insert(~missing, 20);
        Console.WriteLine(string.Join(" ", list));

        list.Sort((a, b) => b.CompareTo(a));
        Console.WriteLine(string.Join(" ", list));
        list.RemoveAll(x => x % 2 == 0);
        Console.WriteLine(string.Join(" ", list));
        list.Reverse();
        Console.WriteLine(list.FindIndex(x => x > 20) + " " + list.Exists(x => x == 3));
    }
}
