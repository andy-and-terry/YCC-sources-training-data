// Repunits: numbers made only of the digit 1.
void main () {
    int64 r = 0;
    for (int i = 0; i < 5; i++) {
        r = r * 10 + 1;
        print ("%lld ", r);
    }
    print ("\n");
}
