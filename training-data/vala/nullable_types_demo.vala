string? find_name(int id) {
    if (id == 1) {
        return "Alice";
    }
    if (id == 2) {
        return "Bob";
    }
    return null;
}

int? parse_positive(string text) {
    int value;
    if (int.try_parse(text, out value) && value > 0) {
        return value;
    }
    return null;
}

string describe(string? name) {
    return name ?? "(unknown)";
}

void main() {
    for (int id = 1; id <= 3; id++) {
        string? name = find_name(id);
        if (name != null) {
            stdout.printf("%d -> %s (%d chars)\n", id, name, name.length);
        } else {
            stdout.printf("%d -> not found\n", id);
        }
    }

    stdout.printf("%s\n", describe(find_name(2)));
    stdout.printf("%s\n", describe(find_name(9)));

    foreach (string s in new string[] { "42", "-5", "abc" }) {
        int? n = parse_positive(s);
        if (n != null) {
            stdout.printf("%s parsed as %d\n", s, n);
        } else {
            stdout.printf("%s rejected\n", s);
        }
    }

    string? empty = null;
    stdout.printf("%s\n", empty == null ? "empty is null" : "empty is set");
}
