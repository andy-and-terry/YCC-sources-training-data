T max_of<T> (T[] items, CompareDataFunc<T> cmp) {
    T best = items[0];
    foreach (var item in items) {
        if (cmp (item, best) > 0) {
            best = item;
        }
    }
    return best;
}

void main () {
    int[] nums = { 4, 17, 9, 2 };
    stdout.printf ("max int: %d\n", max_of<int> (nums, (a, b) => a - b));

    string[] words = { "pear", "fig", "banana", "kiwi" };
    var longest = max_of<string> (words, (a, b) => (int) a.length - (int) b.length);
    stdout.printf ("longest word: %s\n", longest);
}
