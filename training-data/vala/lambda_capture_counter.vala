delegate int Counter ();

Counter make_counter (int start, int step) {
    int value = start;
    return () => {
        int current = value;
        value += step;
        return current;
    };
}

void main () {
    var by_one = make_counter (0, 1);
    var by_ten = make_counter (100, 10);

    stdout.printf ("%d %d %d\n", by_one (), by_one (), by_one ());
    stdout.printf ("%d %d\n", by_ten (), by_ten ());
}
