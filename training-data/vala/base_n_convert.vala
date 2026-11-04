string to_base (uint64 n, int base) {
    const string DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz";
    if (n == 0) return "0";
    var sb = new StringBuilder ();
    while (n > 0) {
        sb.prepend_c (DIGITS[(int) (n % base)]);
        n /= base;
    }
    return sb.str;
}

void main () {
    foreach (int b in new int[] { 2, 8, 16, 36 })
        print ("255 in base %d = %s\n", b, to_base (255, b));
    print ("%d\n", (int) uint64.parse ("ff", 16));
}
