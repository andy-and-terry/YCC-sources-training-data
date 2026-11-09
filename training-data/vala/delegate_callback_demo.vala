delegate int BinOp (int a, int b);

int apply (BinOp op, int a, int b) { return op (a, b); }

void main () {
    print ("%d\n", apply ((a, b) => a + b, 3, 4));
    print ("%d\n", apply ((a, b) => a * b, 3, 4));
}
