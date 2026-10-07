int popcount(uint n) {
    int count = 0;
    while (n != 0) {
        n &= n - 1;
        count++;
    }
    return count;
}

bool is_bit_set(uint n, int pos) {
    return ((n >> pos) & 1) == 1;
}

uint reverse_bits8(uint n) {
    uint result = 0;
    for (int i = 0; i < 8; i++) {
        result = (result << 1) | (n & 1);
        n >>= 1;
    }
    return result;
}

void main() {
    stdout.printf("popcount(255) = %d\n", popcount(255));
    stdout.printf("bit 3 of 8: %s\n", is_bit_set(8, 3).to_string());
    stdout.printf("reverse(1) = %u\n", reverse_bits8(1));
    stdout.printf("xor swap: ");
    int a = 5, b = 9;
    a ^= b; b ^= a; a ^= b;
    stdout.printf("%d %d\n", a, b);
    stdout.printf("lowest set bit of 12: %d\n", 12 & -12);
}
