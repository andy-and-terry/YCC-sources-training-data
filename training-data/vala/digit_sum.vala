int digit_sum(int n) {
    int total = 0;
    while (n > 0) {
        total += n % 10;
        n /= 10;
    }
    return total;
}

void main() {
    stdout.printf("%d\n", digit_sum(12345));
}
