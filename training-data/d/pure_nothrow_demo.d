import std.stdio;

int square(int x) pure nothrow @nogc @safe {
    return x * x;
}

int sumSquares(const int[] xs) pure nothrow @safe {
    int total;
    foreach (x; xs) total += square(x);
    return total;
}

void main() {
    writeln(sumSquares([1, 2, 3, 4]));
}
