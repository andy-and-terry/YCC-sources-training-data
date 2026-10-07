string? find_name(int id) {
    if (id == 1) {
        return "Ada";
    }
    return null;
}

void main() {
    for (int id = 1; id <= 2; id++) {
        string? name = find_name(id);
        if (name != null) {
            stdout.printf("found: %s\n", name);
        } else {
            stdout.printf("id %d not found\n", id);
        }
    }

    string fallback = find_name(2) ?? "unknown";
    stdout.printf("%s\n", fallback);

    string? maybe = find_name(1);
    stdout.printf("length: %d\n", maybe.length);
    stdout.printf("forced: %s\n", maybe);
}
