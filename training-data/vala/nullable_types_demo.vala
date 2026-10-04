string? find_name (string[] names, string prefix) {
    foreach (var n in names) {
        if (n.has_prefix (prefix)) {
            return n;
        }
    }
    return null;
}

void main () {
    string[] names = { "alice", "bob", "carol" };

    string? hit = find_name (names, "b");
    stdout.printf ("hit: %s\n", hit ?? "none");

    string? miss = find_name (names, "z");
    stdout.printf ("miss: %s\n", miss ?? "none");

    if (miss == null) {
        stdout.printf ("nothing found\n");
    }

    int? maybe = null;
    stdout.printf ("is null: %s\n", (maybe == null).to_string ());
    string upper = (hit != null) ? hit.up () : "";
    stdout.printf ("%s\n", upper);
}
