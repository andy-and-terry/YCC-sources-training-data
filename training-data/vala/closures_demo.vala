delegate int Counter();

Counter make_counter(int start) {
    int count = start;
    return () => {
        count++;
        return count;
    };
}

void main() {
    var counter_a = make_counter(0);
    var counter_b = make_counter(100);

    stdout.printf("%d\n", counter_a());
    stdout.printf("%d\n", counter_a());
    stdout.printf("%d\n", counter_a());

    stdout.printf("%d\n", counter_b());
    stdout.printf("%d\n", counter_b());

    stdout.printf("%d\n", counter_a());
}
