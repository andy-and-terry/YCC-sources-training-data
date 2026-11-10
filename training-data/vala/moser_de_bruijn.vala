// Read the binary digits of i as base-4 digits.
int64 moser_de_bruijn (int i) {
    int64 value = 0, power = 1;
    for (; i > 0; i >>= 1) {
        if ((i & 1) == 1) value += power;
        power *= 4;
    }
    return value;
}

void main () {
    for (int i = 0; i < 10; i++) print ("%lld ", moser_de_bruijn (i));
    print ("\n"); // 0 1 4 5 16 17 20 21 64 65
}
