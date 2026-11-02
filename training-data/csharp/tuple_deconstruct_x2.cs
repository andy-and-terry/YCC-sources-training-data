using System;

class TupleDeconstructX2 {
    static (int min, int max) Range(int[] xs) => (Array.Min(xs), Array.Max(xs));
    static void Main() {
        var (lo, hi) = Range(new[] { 3, 9, 1 });
        Console.WriteLine($"{lo}..{hi}");
    }
}
