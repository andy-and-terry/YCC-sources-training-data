delegate int IntOp (int x);

IntOp make_adder (int n) {
    return (x) => x + n;
}

int apply_twice (IntOp f, int v) {
    return f (f (v));
}

void main () {
    var add5 = make_adder (5);
    stdout.printf ("%d\n", add5 (10));
    stdout.printf ("%d\n", apply_twice (add5, 1));

    int counter = 0;
    IntOp bump = (x) => {
        counter += x;
        return counter;
    };
    bump (3);
    bump (4);
    stdout.printf ("counter = %d\n", counter);

    IntOp square = (x) => x * x;
    stdout.printf ("%d\n", apply_twice (square, 3));
}
