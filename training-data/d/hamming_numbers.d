import std.stdio;

// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
bool isHamming(long n) {
    foreach (p; [2, 3, 5])
        while (n % p == 0) n /= p;
    return n == 1;
}

void main() {
    long[] found;
    for (long n = 1; found.length < 20; n++)
        if (isHamming(n)) found ~= n;
    writeln(found);
}
