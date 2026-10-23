import std.stdio;

// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
void main() {
    long[] p = [1, 1, 1];
    foreach (i; 3 .. 15)
        p ~= p[i - 2] + p[i - 3];
    writeln(p);
}
