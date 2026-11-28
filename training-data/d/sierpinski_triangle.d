import std.stdio;
import std.range : repeat;
import std.array : array;

void main() {
    enum n = 8;
    foreach (r; 0 .. n) {
        write(' '.repeat(n - r - 1));
        foreach (c; 0 .. r + 1) write((r & c) == c ? "* " : "  ");
        writeln();
    }
}
