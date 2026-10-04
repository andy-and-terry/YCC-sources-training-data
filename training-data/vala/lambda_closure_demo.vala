delegate int IntOp (int x);

IntOp make_adder (int n) {
    return (x) => x + n;
}

IntOp make_counter () {
    int count = 0;
    return (step) => {
        count += step;
        return count;
    };
}

int apply_twice (IntOp op, int value) {
    return op (op (value));
}

void main () {
    var add5 = make_adder (5);
    print ("%d\n", add5 (10));
    print ("%d\n", apply_twice (add5, 1));

    var counter = make_counter ();
    counter (1);
    counter (2);
    print ("counter: %d\n", counter (3));

    int factor = 3;
    print ("%d\n", apply_twice ((x) => x * factor, 2));
}
