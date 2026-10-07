void divide(int a, int b, out int quotient, out int remainder) {
    quotient = a / b;
    remainder = a % b;
}

void min_max(int[] values, out int min, out int max) {
    min = values[0];
    max = values[0];
    foreach (int v in values) {
        if (v < min) min = v;
        if (v > max) max = v;
    }
}

void swap(ref int a, ref int b) {
    int tmp = a;
    a = b;
    b = tmp;
}

void double_all(ref int[] values) {
    for (int i = 0; i < values.length; i++) {
        values[i] *= 2;
    }
}

bool try_split(string text, out string head, out string tail) {
    int idx = text.index_of_char(':');
    if (idx < 0) {
        head = text;
        tail = "";
        return false;
    }
    head = text.substring(0, idx);
    tail = text.substring(idx + 1);
    return true;
}

void main() {
    int q, r;
    divide(17, 5, out q, out r);
    stdout.printf("17 / 5 = %d remainder %d\n", q, r);

    int lo, hi;
    min_max({ 4, 9, 1, 7 }, out lo, out hi);
    stdout.printf("min=%d max=%d\n", lo, hi);

    int x = 1, y = 2;
    swap(ref x, ref y);
    stdout.printf("x=%d y=%d\n", x, y);

    int[] data = { 1, 2, 3 };
    double_all(ref data);
    stdout.printf("%d %d %d\n", data[0], data[1], data[2]);

    string h, t;
    if (try_split("key:value", out h, out t)) {
        stdout.printf("head=%s tail=%s\n", h, t);
    }
    if (!try_split("nocolon", out h, out t)) {
        stdout.printf("no separator in '%s'\n", h);
    }
}
