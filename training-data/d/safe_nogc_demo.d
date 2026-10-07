import std.stdio;

@safe @nogc pure int square(int x) {
    return x * x;
}

@safe @nogc nothrow int clampSafe(int value, int lo, int hi) {
    if (value < lo) return lo;
    if (value > hi) return hi;
    return value;
}

@safe int sumSquares(const int[] values) {
    int total = 0;
    foreach (v; values) {
        total += square(v);
    }
    return total;
}

void main() {
    writeln(square(6));
    writeln(clampSafe(15, 0, 10));
    writeln(sumSquares([1, 2, 3, 4]));
}
