import std.stdio;

// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
void main() {
    long r = 0;
    foreach (n; 1 .. 9) {
        r = r * 10 + 1;
        writeln(r, r % 3 == 0 ? "  (divisible by 3)" : "");
    }
}
