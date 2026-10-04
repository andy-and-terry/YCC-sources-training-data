string repeat_join(string word, int times, string sep) {
    var sb = new StringBuilder();
    for (int i = 0; i < times; i++) {
        if (i > 0) {
            sb.append(sep);
        }
        sb.append(word);
    }
    return sb.str;
}

void main() {
    var sb = new StringBuilder("Hello");
    sb.append(", ");
    sb.append("World");
    sb.append_c('!');
    stdout.printf("%s (len %d)\n", sb.str, (int) sb.len);

    sb.prepend(">> ");
    sb.insert(3, "[x]");
    stdout.printf("%s\n", sb.str);

    sb.erase(3, 3);
    stdout.printf("%s\n", sb.str);

    sb.truncate(8);
    stdout.printf("[%s]\n", sb.str);

    var numbers = new StringBuilder();
    for (int i = 1; i <= 5; i++) {
        numbers.append_printf("%d^2=%d ", i, i * i);
    }
    stdout.printf("%s\n", numbers.str.strip());

    stdout.printf("%s\n", repeat_join("ab", 3, "-"));
}
