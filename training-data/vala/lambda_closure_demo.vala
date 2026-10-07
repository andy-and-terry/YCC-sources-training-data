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

void main() {
    var add5 = make_adder(5);
    stdout.printf("%d\n", add5(10));

    var counter = make_counter();
    counter(1);
    counter(2);
    stdout.printf("counter: %d\n", counter(3));

    int[] data = {1, 2, 3, 4};
    int sum = 0;
    IntOp accumulate = (x) => {
        sum += x;
        return sum;
    };
    foreach (int d in data) {
        accumulate(d);
    }
    stdout.printf("sum: %d\n", sum);
}
