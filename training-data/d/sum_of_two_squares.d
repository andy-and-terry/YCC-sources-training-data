import std.stdio;

// Positive n expressible as a*a + b*b with a, b >= 0.
bool representable(int n) {
    for (int a = 0; a * a <= n; a++)
        for (int b = a; a * a + b * b <= n; b++)
            if (a * a + b * b == n) return true;
    return false;
}

void main() {
    foreach (n; 1 .. 31)
        if (representable(n)) write(n, " ");
    writeln();
}
