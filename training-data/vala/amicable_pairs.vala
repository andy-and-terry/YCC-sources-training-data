// Amicable pairs below 1500 via sums of proper divisors.
int s (int n) {
    int t = 0;
    for (int d = 1; d < n; d++) {
        if (n % d == 0) t += d;
    }
    return t;
}

void main () {
    for (int a = 2; a < 1500; a++) {
        int b = s (a);
        if (b > a && s (b) == a) print ("%d %d\n", a, b);
    }
}
