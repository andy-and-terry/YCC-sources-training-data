import std.stdio;
// Lattice paths with a DP row.
long lattice(int n) {
    auto row = new long[n + 1];
    row[] = 1;
    foreach (k; 0 .. n) foreach (j; 1 .. n + 1) row[j] += row[j - 1];
    return row[n];
}
void main() { writeln(lattice(3)); }
