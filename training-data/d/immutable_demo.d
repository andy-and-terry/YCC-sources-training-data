import std.stdio;

immutable int[] fixedValues = [1, 2, 3, 4, 5];

int sumImmutable(immutable int[] arr) {
    int total = 0;
    foreach (v; arr) total += v;
    return total;
}

void main() {
    writeln(sumImmutable(fixedValues));
}
