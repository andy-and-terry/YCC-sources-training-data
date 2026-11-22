import std.stdio;

// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
void main() {
    ulong r = 0;
    foreach (i; 0 .. 8) {
        r = r * 10 + 1;
        write(r, " ");
    }
    writeln();
}
