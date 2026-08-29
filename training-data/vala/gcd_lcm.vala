int my_gcd(int a, int b) {
    while (b != 0) {
        int t = b;
        b = a % b;
        a = t;
    }
    return a.abs();
}

int my_lcm(int a, int b) {
    return (a * b).abs() / my_gcd(a, b);
}

void main() {
    stdout.printf("%d\n", my_gcd(48, 18));
    stdout.printf("%d\n", my_lcm(4, 6));
}
