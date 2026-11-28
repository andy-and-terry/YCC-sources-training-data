import std.stdio;

int[] stern(size_t count) {
    auto seq = new int[count < 2 ? 2 : count];
    seq[1] = 1;
    foreach (i; 2 .. count)
        seq[i] = (i % 2 == 0) ? seq[i / 2] : seq[i / 2] + seq[i / 2 + 1];
    return seq[0 .. count];
}

void main() {
    writeln(stern(15)); // [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
}
