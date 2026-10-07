void main () {
    var seen = new GLib.HashTable<string, bool> (str_hash, str_equal);
    string[] items = { "a", "b", "a", "c", "b", "a" };

    foreach (var item in items) {
        if (seen.contains (item)) {
            stdout.printf ("duplicate: %s\n", item);
        } else {
            seen.insert (item, true);
        }
    }
    stdout.printf ("unique count: %u\n", seen.size ());

    var keys = seen.get_keys ();
    keys.sort (strcmp);
    foreach (var k in keys) {
        stdout.printf ("%s ", k);
    }
    stdout.printf ("\n");

    seen.remove ("a");
    stdout.printf ("after remove: %u\n", seen.size ());
}
