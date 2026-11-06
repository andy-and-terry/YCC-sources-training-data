// Highest value reached by the Collatz (hailstone) sequence from n.
import std.algorithm : max;
import std.stdio;

long peak(long n) {
    long best = n;
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
        best = max(best, n);
    }
    return best;
}

void main() {
    writeln(peak(27));
}
