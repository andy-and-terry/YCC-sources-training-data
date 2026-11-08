import std.stdio;

void hanoi(int n, char a, char b, char c, ref string[] out_) {
    if (n == 0) return;
    hanoi(n - 1, a, c, b, out_);
    out_ ~= [a, '-', '>', c].idup;
    hanoi(n - 1, b, a, c, out_);
}

void main() {
    string[] moves;
    hanoi(3, 'A', 'B', 'C', moves);
    writeln(moves.length, ": ", moves);
}
