using System;
using System.Collections.Generic;

class DictionaryTryGetValueX2 {
    static void Main() {
        var d = new Dictionary<string, int> { ["a"] = 1 };
        Console.WriteLine(d.TryGetValue("a", out var v) ? v : -1);
        Console.WriteLine(d.TryGetValue("b", out var w) ? w : -1);
    }
}
