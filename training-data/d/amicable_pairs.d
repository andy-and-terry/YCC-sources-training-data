// Amicable pairs: d(a) == b and d(b) == a with a != b.
import std.algorithm : filter, sum;
import std.range : iota;
import std.stdio;

int d(int n) {
    return iota(1, n).filter!(i => n % i == 0).sum;
}

void main() {
    foreach (a; 2 .. 1500) {
        int b = d(a);
        if (b > a && d(b) == a) writeln(a, " ", b);
    }
}
