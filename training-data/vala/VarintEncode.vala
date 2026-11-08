uint8[] varint (uint n) {
    uint8[] out = {};
    while (n >= 0x80) {
        out += (uint8) ((n & 0x7F) | 0x80);
        n >>= 7;
    }
    out += (uint8) n;
    return out;
}

void main () {
    foreach (uint8 b in varint (300)) print ("%02x ", b);
    print ("\n");
}
