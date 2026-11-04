import std.stdio;
import std.algorithm : min;

long ugly(int n) {
    long[] seq = [1];
    size_t i2, i3, i5;
    while (seq.length < n) {
        long c2 = seq[i2] * 2, c3 = seq[i3] * 3, c5 = seq[i5] * 5;
        long next = min(c2, c3, c5);
        seq ~= next;
        if (next == c2) i2++;
        if (next == c3) i3++;
        if (next == c5) i5++;
    }
    return seq[n - 1];
}

void main() {
    foreach (i; 1 .. 13) write(ugly(i), " ");
    writeln();
}
