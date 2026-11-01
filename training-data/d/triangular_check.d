import std.stdio;
import std.math : sqrt, round;

// n is triangular iff 8n + 1 is a perfect square.
bool isTriangular(int n) {
    int s = 8 * n + 1;
    int r = cast(int) round(sqrt(cast(double) s));
    return r * r == s;
}

void main() {
    foreach (n; 0 .. 21)
        if (isTriangular(n)) write(n, " ");
    writeln();
}
