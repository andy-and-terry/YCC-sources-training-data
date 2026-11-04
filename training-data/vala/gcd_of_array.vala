int gcd (int a, int b) {
    while (b != 0) {
        int t = a % b;
        a = b;
        b = t;
    }
    return a.abs ();
}

int gcd_all (int[] nums) {
    int g = 0;
    foreach (int n in nums) g = gcd (g, n);
    return g;
}

void main () {
    print ("%d\n", gcd_all ({ 12, 18, 24 }));
    print ("%d\n", gcd_all ({ 7, 13 }));
}
