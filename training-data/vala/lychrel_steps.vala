// Reverse-and-add until a palindrome; count the steps.
int64 reverse_digits (int64 n) {
    int64 r = 0;
    while (n > 0) {
        r = r * 10 + n % 10;
        n /= 10;
    }
    return r;
}

int steps (int64 n) {
    for (int count = 0; count < 50; count++) {
        if (count > 0 && n == reverse_digits (n)) return count;
        n += reverse_digits (n);
    }
    return -1;
}

void main () {
    int64[] starts = { 56, 57, 59, 79, 89 };
    foreach (int64 s in starts) {
        print ("%d ", steps (s));
    }
    print ("\n");
}
