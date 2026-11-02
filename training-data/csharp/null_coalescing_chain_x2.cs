using System;

class NullCoalescingChainX2 {
    static void Main() {
        string? a = null, b = null, c = "fallback";
        Console.WriteLine(a ?? b ?? c);
        a ??= "set";
        Console.WriteLine(a);
    }
}
