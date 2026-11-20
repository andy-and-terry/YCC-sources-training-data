using System;
using System.Linq;

// Aliquot sum with a switch expression.
class AliquotSum {
    static void Main() {
        foreach (var n in new[] { 6, 12, 15, 28 }) {
            int a = Enumerable.Range(1, n - 1).Where(d => n % d == 0).Sum();
            string kind = a == n ? "perfect" : a > n ? "abundant" : "deficient";
            Console.WriteLine($"{n} {a} {kind}");
        }
    }
}
