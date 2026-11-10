import std.stdio;

// Read the binary digits of i as base-4 digits.
ulong moserDeBruijn(uint i) {
    ulong value = 0, power = 1;
    for (; i > 0; i >>= 1) {
        if (i & 1) value += power;
        power *= 4;
    }
    return value;
}

void main() {
    foreach (i; 0 .. 10) write(moserDeBruijn(i), " ");
    writeln(); // 0 1 4 5 16 17 20 21 64 65
}
