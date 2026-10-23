void main() {
    // A seeded generator gives a reproducible sequence.
    var rng = new Rand.with_seed(42);
    int first = rng.int_range(1, 7);
    rng.set_seed(42);
    int again = rng.int_range(1, 7);
    stdout.printf("same seed, same roll: %s\n", (first == again).to_string());

    // Simulate 600 dice rolls and tally the faces.
    int[] counts = new int[7];
    for (int i = 0; i < 600; i++) {
        counts[rng.int_range(1, 7)]++;
    }
    int total = 0;
    for (int face = 1; face <= 6; face++) {
        total += counts[face];
    }
    stdout.printf("total rolls tallied: %d\n", total);

    // Shuffle an array with Fisher-Yates.
    string[] names = { "ant", "bee", "cat", "dog", "eel" };
    for (int i = names.length - 1; i > 0; i--) {
        int j = rng.int_range(0, i + 1);
        var tmp = names[i];
        names[i] = names[j];
        names[j] = tmp;
    }
    stdout.printf("shuffled length: %d\n", names.length);

    double d = rng.next_double();
    stdout.printf("double in [0,1): %s\n", (d >= 0.0 && d < 1.0).to_string());
    bool coin = rng.boolean();
    stdout.printf("coin flip is a bool: %s\n", (coin || !coin).to_string());
}
