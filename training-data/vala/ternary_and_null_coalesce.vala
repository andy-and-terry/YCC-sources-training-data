string describe (int? value) {
    return value != null ? "has %d".printf (value) : "nothing";
}

void main () {
    string? name = null;
    string shown = name ?? "anonymous";
    stdout.printf ("%s\n", shown);

    name = "Zed";
    stdout.printf ("%s\n", name ?? "anonymous");

    int? a = 5;
    int? b = null;
    stdout.printf ("%s / %s\n", describe (a), describe (b));

    int n = 15;
    string size = n < 10 ? "small" : n < 20 ? "medium" : "large";
    stdout.printf ("%s\n", size);
}
