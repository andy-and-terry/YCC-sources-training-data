int mod_pow(int base_value, int exponent, int modulus) {
    if (modulus == 1) return 0;

    int result = 1;
    int b = base_value % modulus;
    int e = exponent;
    while (e > 0) {
        if ((e & 1) == 1) {
            result = (result * b) % modulus;
        }
        e >>= 1;
        b = (b * b) % modulus;
    }
    return result;
}

void main() {
    stdout.printf("%d\n", mod_pow(2, 10, 1000));
    stdout.printf("%d\n", mod_pow(3, 200, 50));
    stdout.printf("%d\n", mod_pow(7, 0, 13));
}
