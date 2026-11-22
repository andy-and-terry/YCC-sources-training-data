import std.stdio;

// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
void main() {
    long[] row = [1];
    write(1, " ");
    foreach (i; 0 .. 9) {
        long[] next = [0];
        foreach_reverse (x; row) next ~= next[$ - 1] + x;
        row = next;
        write(row[$ - 1], " ");
    }
    writeln();
}
