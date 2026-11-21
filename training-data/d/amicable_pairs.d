import std.stdio;

// Amicable pairs below 1500 via sums of proper divisors.
int s(int n) {
    int t = 0;
    foreach (d; 1 .. n)
        if (n % d == 0) t += d;
    return t;
}

void main() {
    foreach (a; 2 .. 1500) {
        int b = s(a);
        if (b > a && s(b) == a) writeln(a, " ", b);
    }
}
