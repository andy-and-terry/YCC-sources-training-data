void main() {
    var sb = new StringBuilder();
    for (int i = 1; i <= 5; i++) {
        if (sb.len > 0) {
            sb.append(", ");
        }
        sb.append_printf("item%d", i);
    }
    sb.prepend("[");
    sb.append("]");
    stdout.printf("%s (length %d)\n", sb.str, (int) sb.len);

    sb.truncate(5);
    stdout.printf("%s\n", sb.str);
    sb.insert(1, "XX");
    stdout.printf("%s\n", sb.str);
}
