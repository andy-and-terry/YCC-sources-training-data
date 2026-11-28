uint8 reverse_bits (uint8 v) {
    uint8 r = 0;
    for (int i = 0; i < 8; i++) {
        r = (uint8) ((r << 1) | (v & 1));
        v >>= 1;
    }
    return r;
}

void main () {
    uint8[] inputs = { 1, 6, 13, 128 };
    foreach (uint8 v in inputs) {
        stdout.printf ("%u %u\n", v, reverse_bits (v)); // 128 96 176 1
    }
}
