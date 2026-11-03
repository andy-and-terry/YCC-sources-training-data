void main () {
    int[] items = { 1, 2, 2, 3, 3, 4 };
    var counts = new HashTable<int, int> (direct_hash, direct_equal);
    int top = 0;
    foreach (int x in items) {
        int c = counts.contains (x) ? counts[x] + 1 : 1;
        counts[x] = c;
        if (c > top) top = c;
    }
    var keys = counts.get_keys ();
    keys.sort ((a, b) => a - b);
    foreach (int k in keys) {
        if (counts[k] == top) print ("%d ", k);
    }
    print ("\n");
}
