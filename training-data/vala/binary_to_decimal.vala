int binary_to_decimal(string s) {
    int result = 0;
    for (int i = 0; i < s.length; i++) {
        result = result * 2 + (int)(s[i] - '0');
    }
    return result;
}

void main() {
    stdout.printf("%d\n", binary_to_decimal("1011"));
}
