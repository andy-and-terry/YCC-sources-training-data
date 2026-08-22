using System;
using System.Collections.Generic;
using System.Linq;

class DoublyLinkedListDemo
{
    static void Main()
    {
        var dll = new LinkedList<int>(new[] { 1, 2, 3, 4 });
        var node = dll.Find(3);
        if (node != null) dll.Remove(node);
        Console.WriteLine(string.Join(" ", dll));
    }
}
