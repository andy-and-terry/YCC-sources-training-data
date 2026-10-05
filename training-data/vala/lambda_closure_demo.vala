delegate int IntOp(int x);

IntOp make_adder(int n) {
    return (x) => x + n;
}

IntOp make_counter() {
    int count = 0;
    return (step) => {
        count += step;
        return count;
    };
}

void apply_all(int[] values, IntOp op) {
    foreach (int v in values) {
        stdout.printf("%d ", op(v));
    }
    stdout.printf("\n");
}

void main() {
    var add5 = make_adder(5);
    stdout.printf("%d\n", add5(10));

    var counter = make_counter();
    counter(1);
    counter(1);
    stdout.printf("%d\n", counter(3));

    apply_all({ 1, 2, 3 }, (x) => x * x);
}
