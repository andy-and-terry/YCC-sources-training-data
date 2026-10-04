string? find_name (int id) {
    if (id == 1) {
        return "Alice";
    }
    if (id == 2) {
        return "Bob";
    }
    return null;
}

int? parse_positive (string s) {
    int v;
    if (int.try_parse (s, out v) && v > 0) {
        return v;
    }
    return null;
}

void main () {
    for (int id = 1; id <= 3; id++) {
        string? name = find_name (id);
        print ("id %d -> %s\n", id, name ?? "(unknown)");
    }

    int? a = parse_positive ("42");
    int? b = parse_positive ("-5");
    print ("a=%d\n", a != null ? a : -1);
    print ("b is null: %s\n", (b == null).to_string ());

    string? maybe = null;
    print ("length: %d\n", maybe != null ? maybe.length : 0);
}
