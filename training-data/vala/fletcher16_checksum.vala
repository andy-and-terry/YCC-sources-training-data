uint16 fletcher16 (uint8[] data) {
    uint s1 = 0, s2 = 0;
    foreach (var b in data) {
        s1 = (s1 + b) % 255;
        s2 = (s2 + s1) % 255;
    }
    return (uint16) ((s2 << 8) | s1);
}

void main () {
    print ("%x\n", fletcher16 ("abcde".data));
}
