void divmod(int a, int b, out int quotient, out int remainder) {
    quotient = a / b;
    remainder = a % b;
}

void swap(ref int a, ref int b) {
    int tmp = a;
    a = b;
    b = tmp;
}

bool try_parse(string text, out int value) {
    return int.try_parse(text, out value);
}

void main() {
    int q, r;
    divmod(17, 5, out q, out r);
    stdout.printf("%d r %d\n", q, r);

    int x = 1, y = 2;
    swap(ref x, ref y);
    stdout.printf("%d %d\n", x, y);

    int parsed;
    if (try_parse("123", out parsed)) {
        stdout.printf("parsed %d\n", parsed);
    }
    if (!try_parse("abc", out parsed)) {
        stdout.printf("not a number\n");
    }
}
