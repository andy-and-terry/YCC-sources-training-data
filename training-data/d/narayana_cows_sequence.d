import std.stdio;

// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
void main() {
    long[] n = [1, 1, 1];
    foreach (i; 3 .. 15) n ~= n[i - 1] + n[i - 3];
    writeln(n);
}
