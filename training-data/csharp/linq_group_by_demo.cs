using System;
using System.Linq;

class Program {
    static void Main() {
        var words = new[] { "apple", "avocado", "banana", "blueberry", "cherry" };
        foreach (var g in words.GroupBy(w => w[0]))
            Console.WriteLine($"{g.Key}: {string.Join(", ", g)}");
    }
}
