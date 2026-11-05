string? find (string key) {
    return key == "a" ? "alpha" : null;
}

void main () {
    print ("%s\n", find ("a") ?? "none");
    print ("%s\n", find ("z") ?? "none");
}
