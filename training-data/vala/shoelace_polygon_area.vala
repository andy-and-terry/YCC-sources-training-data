double area (double[,] p, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) {
        int j = (i + 1) % n;
        s += p[i, 0] * p[j, 1] - p[j, 0] * p[i, 1];
    }
    return Math.fabs (s) / 2;
}

void main () {
    double[,] sq = { { 0, 0 }, { 4, 0 }, { 4, 3 }, { 0, 3 } };
    print ("%.1f\n", area (sq, 4));
}
