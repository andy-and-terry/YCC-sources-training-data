import std.stdio;
import std.conv : to;
import std.algorithm : sum;

// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
bool isKeith(int n) {
    int[] seq;
    foreach (c; n.to!string) seq ~= c - '0';
    immutable k = seq.length;
    while (seq[$ - 1] < n)
        seq ~= seq[$ - k .. $].sum;
    return seq[$ - 1] == n;
}

void main() {
    foreach (n; 10 .. 1200)
        if (isKeith(n)) write(n, " ");
    writeln();
}
