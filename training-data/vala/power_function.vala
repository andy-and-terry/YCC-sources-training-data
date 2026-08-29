int my_power(int base, int exp) {
    if (exp == 0) return 1;
    if (exp % 2 == 0) {
        int half = my_power(base, exp / 2);
        return half * half;
    }
    return base * my_power(base, exp - 1);
}

void main() {
    stdout.printf("%d\n", my_power(2, 10));
    stdout.printf("%d\n", my_power(3, 5));
}
