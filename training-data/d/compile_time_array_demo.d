import std.stdio;

int[] makeSquares(int n) {
    int[] r;
    foreach (i; 0 .. n) r ~= i * i;
    return r;
}

enum table = makeSquares(8);
static assert(table[7] == 49);

void main() {
    writeln(table);
}
