import std.stdio;

// Aliquot sequence: replace n by the sum of its proper divisors.
int aliquotSum(int n) {
    int s = 0;
    foreach (d; 1 .. n / 2 + 1)
        if (n % d == 0) s += d;
    return s;
}

void main() {
    int[] seq = [12];
    while (seq[$ - 1] > 1 && seq.length < 20)
        seq ~= aliquotSum(seq[$ - 1]);
    writeln(seq);
}
