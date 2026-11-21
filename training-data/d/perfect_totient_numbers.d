import std.stdio;
import std.numeric : gcd;

// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
int phi(int n) {
    int c = 0;
    foreach (k; 1 .. n + 1)
        if (gcd(k, n) == 1) c++;
    return c;
}

bool isPerfectTotient(int n) {
    int total = 0;
    for (int m = n; m > 1;) {
        m = phi(m);
        total += m;
    }
    return total == n;
}

void main() {
    foreach (n; 2 .. 200)
        if (isPerfectTotient(n)) write(n, " ");
    writeln();
}
