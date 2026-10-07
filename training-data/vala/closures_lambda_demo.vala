delegate int IntTransform(int x);

IntTransform make_adder(int amount) {
    return (x) => x + amount;
}

void main() {
    var add_five = make_adder(5);
    stdout.printf("%d\n", add_five(10));

    int counter = 0;
    IntTransform increment_counter = (x) => {
        counter += x;
        return counter;
    };

    stdout.printf("%d\n", increment_counter(3));
    stdout.printf("%d\n", increment_counter(4));

    int[] numbers = { 1, 2, 3, 4, 5 };
    int total = 0;
    foreach (int n in numbers) {
        IntTransform square = (x) => x * x;
        total += square(n);
    }
    stdout.printf("sum of squares: %d\n", total);
}
