void insertion_sort (string[] items) {
    for (int i = 1; i < items.length; i++) {
        string key = items[i];
        int j = i - 1;
        while (j >= 0 && strcmp (items[j], key) > 0) {
            items[j + 1] = items[j];
            j--;
        }
        items[j + 1] = key;
    }
}

void main () {
    string[] names = { "mango", "apple", "cherry", "banana" };
    insertion_sort (names);
    foreach (var n in names) {
        stdout.printf ("%s\n", n);
    }
}
