import std.stdio;

int[] primesUpTo(int n) {
    int[] r;
    foreach (i; 2 .. n + 1) {
        bool ok = true;
        for (int d = 2; d * d <= i; d++) if (i % d == 0) { ok = false; break; }
        if (ok) r ~= i;
    }
    return r;
}

enum table = primesUpTo(30);

void main() { writeln(table); }
