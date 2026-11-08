double area (double[] x, double[] y) {
    double s = 0;
    int n = x.length;
    for (int i = 0; i < n; i++) {
        int j = (i + 1) % n;
        s += x[i] * y[j] - x[j] * y[i];
    }
    return s.abs () / 2;
}

void main () {
    print ("%g\n", area ({ 0, 4, 4, 0 }, { 0, 0, 3, 3 }));
}
