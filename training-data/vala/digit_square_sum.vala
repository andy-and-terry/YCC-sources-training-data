int digit_square_sum (int n) {
    n = n.abs ();
    int sum = 0;
    while (n > 0) {
        int d = n % 10;
        sum += d * d;
        n /= 10;
    }
    return sum;
}

void main () {
    print ("%d\n", digit_square_sum (123));
    print ("%d\n", digit_square_sum (-99));
}
