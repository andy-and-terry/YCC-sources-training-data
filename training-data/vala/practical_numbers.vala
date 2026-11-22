// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
bool is_practical (int n) {
    uint64 reach = 1; // bit i set <=> i is a subset sum
    for (int d = 1; d <= n; d++) {
        if (n % d == 0) reach |= reach << d;
    }
    uint64 mask = (((uint64) 1) << (n + 1)) - 1;
    return (reach & mask) == mask;
}

void main () {
    for (int n = 1; n <= 40; n++) {
        if (is_practical (n)) print ("%d ", n);
    }
    print ("\n");
}
