int alternating_digit_sum (int n) {
    int total = 0;
    int sign = 1;
    while (n > 0) {
        total += sign * (n % 10);
        sign = -sign;
        n /= 10;
    }
    return total;
}

void main () {
    int[] values = { 1234, 99999, 1000 };
    foreach (int n in values) {
        print ("%d %d\n", n, alternating_digit_sum (n));
    }
}
