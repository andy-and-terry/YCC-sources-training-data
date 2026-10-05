string join_numbers(int[] values) {
    var sb = new StringBuilder();
    for (int i = 0; i < values.length; i++) {
        if (i > 0) sb.append(", ");
        sb.append_printf("%d", values[i]);
    }
    return sb.str;
}

void main() {
    stdout.printf("[%s]\n", join_numbers({ 3, 1, 4, 1, 5 }));

    var sb = new StringBuilder("world");
    sb.prepend("hello ");
    sb.append_c('!');
    sb.insert(5, ",");
    stdout.printf("%s (%d chars)\n", sb.str, (int) sb.len);

    sb.truncate(5);
    stdout.printf("%s\n", sb.str);

    string repeated = string.nfill(3, '=');
    stdout.printf("%s\n", repeated);
}
