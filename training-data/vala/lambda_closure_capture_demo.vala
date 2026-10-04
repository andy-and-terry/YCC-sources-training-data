delegate int IntOp(int x);

IntOp make_adder(int amount) {
    return (x) => x + amount;
}

IntOp make_counter() {
    int count = 0;
    return (step) => {
        count += step;
        return count;
    };
}

int apply_twice(IntOp op, int value) {
    return op(op(value));
}

void main() {
    var add5 = make_adder(5);
    stdout.printf("%d\n", add5(10));
    stdout.printf("%d\n", apply_twice(add5, 1));

    var counter = make_counter();
    counter(1);
    counter(1);
    stdout.printf("counter: %d\n", counter(3));

    var other = make_counter();
    stdout.printf("independent counter: %d\n", other(10));

    IntOp square = (x) => x * x;
    int[] values = { 1, 2, 3, 4 };
    int total = 0;
    foreach (int v in values) {
        total += square(v);
    }
    stdout.printf("sum of squares: %d\n", total);

    int base_value = 100;
    IntOp offset = (x) => x + base_value;
    base_value = 200;
    stdout.printf("captured by reference: %d\n", offset(1));

}
