int sum_all(int first, ...) {
    var args = va_list();
    int total = first;
    while (true) {
        int? next = args.arg();
        if (next == null || next == 0) {
            break;
        }
        total += next;
    }
    return total;
}

void log_message(string format, ...) {
    var args = va_list();
    stdout.printf("[log] %s\n", format.vprintf(args));
}

void main() {
    stdout.printf("%d\n", sum_all(1, 2, 3, 4, 0));
    log_message("%s scored %d points", "Ann", 42);
}
