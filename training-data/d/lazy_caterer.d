import std.stdio;

int pieces(int cuts) { return (cuts * cuts + cuts + 2) / 2; }

void main() {
    foreach (n; 0 .. 10) write(pieces(n), " ");
    writeln(); // 1 2 4 7 11 16 22 29 37 46
}
