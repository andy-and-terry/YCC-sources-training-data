int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

void main() {
    stdout.printf("%d\n", gcd(48, 18));
    stdout.printf("%d\n", gcd(100, 75));
}
