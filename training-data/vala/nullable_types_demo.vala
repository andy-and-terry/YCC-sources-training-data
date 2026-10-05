string? find_name(int id) {
    if (id == 1) return "Ada";
    if (id == 2) return "Linus";
    return null;
}

void greet(string? name) {
    if (name == null) {
        stdout.printf("Hello, stranger\n");
    } else {
        stdout.printf("Hello, %s\n", name);
    }
}

void main() {
    greet(find_name(1));
    greet(find_name(99));

    // Null coalescing operator
    string display = find_name(3) ?? "unknown";
    stdout.printf("%s\n", display);

    int? maybe = null;
    stdout.printf("%s\n", maybe == null ? "no value" : "has value");

    string? s = find_name(2);
    stdout.printf("%d\n", s != null ? s.length : 0);
}
