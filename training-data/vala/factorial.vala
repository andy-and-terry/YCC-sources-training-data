int64 factorial(int n) {
    if (n <= 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

void main() {
    for (int i = 0; i <= 10; i++) {
        stdout.printf("%lld ", factorial(i));
    }
    stdout.printf("\n");
}
