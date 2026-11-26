// Deficient numbers below 100; expect 76.
import std.stdio;

int properSum(int n) {
    int t = 0;
    foreach (d; 1 .. n) if (n % d == 0) t += d;
    return t;
}

void main() {
    int c = 0;
    foreach (n; 1 .. 100) if (properSum(n) < n) c++;
    writeln(c);
}
