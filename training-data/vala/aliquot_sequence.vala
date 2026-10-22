int proper_sum(int n) {
    int sum = 0;
    for (int d = 1; d <= n / 2; d++) {
        if (n % d == 0) {
            sum += d;
        }
    }
    return sum;
}

void main() {
    int n = 12;
    stdout.printf("%d", n);
    while (n != 0) {
        n = proper_sum(n);
        stdout.printf(" %d", n);
    }
    stdout.printf("\n");
}
