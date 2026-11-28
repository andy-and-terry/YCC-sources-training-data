int popcount (uint64 n) {
    int c = 0;
    while (n != 0) {
        n &= n - 1;
        c++;
    }
    return c;
}

void main () {
    print ("%d %d\n", popcount (0xB7), popcount (255));
}
