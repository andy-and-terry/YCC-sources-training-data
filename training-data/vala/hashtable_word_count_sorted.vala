void main () {
    string text = "the cat and the hat and the bat";
    var counts = new HashTable<string, int> (str_hash, str_equal);

    foreach (var w in text.split (" ")) {
        counts[w] = counts.contains (w) ? counts[w] + 1 : 1;
    }

    var keys = counts.get_keys ();
    keys.sort ((a, b) => {
        int diff = counts[b] - counts[a];
        return diff != 0 ? diff : strcmp (a, b);
    });

    foreach (var k in keys) {
        stdout.printf ("%-4s %d\n", k, counts[k]);
    }
}
