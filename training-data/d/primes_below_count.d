import std.stdio;

size_t countPrimesBelow(size_t n) {
    if (n < 3) return 0;
    auto composite = new bool[n];
    size_t count;
    foreach (i; 2 .. n) {
        if (composite[i]) continue;
        count++;
        for (size_t j = i * i; j < n; j += i) composite[j] = true;
    }
    return count;
}

void main() {
    writeln(countPrimesBelow(100));
}
