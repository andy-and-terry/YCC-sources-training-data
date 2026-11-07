import std.stdio;

int[] plusOne(int[] digits) {
    auto d = digits.dup;
    foreach_reverse (ref x; d) {
        if (x < 9) {
            x++;
            return d;
        }
        x = 0;
    }
    return 1 ~ d;
}

void main() {
    writeln(plusOne([1, 2, 9])); // [1, 3, 0]
    writeln(plusOne([9, 9]));    // [1, 0, 0]
}
