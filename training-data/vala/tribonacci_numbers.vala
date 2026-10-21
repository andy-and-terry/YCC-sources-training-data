// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
void main () {
    int64 a = 0, b = 0, c = 1;
    var sb = new StringBuilder ("Tribonacci:");
    for (int i = 0; i < 15; i++) {
        sb.append (" %lld".printf (a));
        int64 next = a + b + c;
        a = b;
        b = c;
        c = next;
    }
    print ("%s\n", sb.str);
}
