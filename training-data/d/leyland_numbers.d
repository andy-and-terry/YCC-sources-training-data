import std.stdio;
import std.bigint;

// Leyland numbers: x^y + y^x for x >= y >= 2.
BigInt leyland(int x, int y) {
    return BigInt(x) ^^ y + BigInt(y) ^^ x;
}

void main() {
    foreach (x; 2 .. 5)
        foreach (y; 2 .. x + 1)
            write(leyland(x, y), " ");
    writeln();
}
