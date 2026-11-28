int chebyshev (int[] a, int[] b) {
    int m = 0;
    for (int i = 0; i < a.length; i++) {
        m = int.max (m, (a[i] - b[i]).abs ());
    }
    return m;
}

void main () {
    print ("%d\n", chebyshev ({ 1, 2 }, { 4, 6 }));
}
