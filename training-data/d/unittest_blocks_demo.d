import std.stdio;

int clamp(int value, int lo, int hi) {
    if (value < lo) return lo;
    if (value > hi) return hi;
    return value;
}

unittest {
    assert(clamp(5, 0, 10) == 5);
    assert(clamp(-5, 0, 10) == 0);
    assert(clamp(15, 0, 10) == 10);
}

int[] squares(int[] values) {
    int[] result;
    foreach (v; values) {
        result ~= v * v;
    }
    return result;
}

unittest {
    assert(squares([1, 2, 3]) == [1, 4, 9]);
    assert(squares([]) == []);
}

void main() {
    writeln(clamp(42, 0, 10));
    writeln(squares([2, 3, 4]));
    writeln("compile with `dmd -unittest -run` to execute the unittest blocks above");
}
