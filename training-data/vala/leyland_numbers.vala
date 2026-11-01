// Leyland numbers: x^y + y^x for x >= y >= 2.
int64 ipow (int64 b, int e) {
    int64 r = 1;
    for (int i = 0; i < e; i++) r *= b;
    return r;
}

void main () {
    for (int x = 2; x <= 4; x++) {
        for (int y = 2; y <= x; y++) {
            print ("%s ", (ipow (x, y) + ipow (y, x)).to_string ());
        }
    }
    print ("\n");
}
