void swap(ref int a, ref int b) {
    int tmp = a;
    a = b;
    b = tmp;
}

bool divide(int a, int b, out int quotient, out int remainder) {
    if (b == 0) {
        quotient = 0;
        remainder = 0;
        return false;
    }
    quotient = a / b;
    remainder = a % b;
    return true;
}

void main() {
    int x = 1;
    int y = 2;
    swap(ref x, ref y);
    stdout.printf("x=%d y=%d\n", x, y);

    int q, r;
    if (divide(17, 5, out q, out r)) {
        stdout.printf("17 / 5 = %d remainder %d\n", q, r);
    }
    if (!divide(1, 0, out q, out r)) {
        stdout.printf("division by zero\n");
    }
}
