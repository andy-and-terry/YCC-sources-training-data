using System;
using System.Linq;

// Wilson's theorem primality test.
class WilsonPrimeCheck {
    static bool Wilson(int n) {
        if (n < 2) return false;
        long f = 1;
        for (int i = 2; i < n; i++) f = f * i % n;
        return f == n - 1;
    }
    static void Main() => Console.WriteLine(string.Join(" ", Enumerable.Range(2, 18).Where(Wilson)));
}
