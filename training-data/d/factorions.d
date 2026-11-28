import std.stdio;

void main() {
    immutable int[10] fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];
    foreach (n; 1 .. 50_000) {
        int s = 0;
        for (int m = n; m > 0; m /= 10) s += fact[m % 10];
        if (s == n) write(n, " ");
    }
    writeln(); // 1 2 145 40585
}
