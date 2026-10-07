void check(string text) {
    int i;
    double d;
    bool ok_int = int.try_parse(text, out i);
    bool ok_double = double.try_parse(text, out d);
    stdout.printf("%-8s int:%-5s double:%s\n", text, ok_int.to_string(), ok_double.to_string());
}

void main() {
    check("42");
    check("-17");
    check("3.14");
    check("1e3");
    check("abc");
    check("12abc");
    check("");

    stdout.printf("%d\n", int.parse("123") + 1);
    stdout.printf("%.2f\n", double.parse("2.5") * 2);
    stdout.printf("%d\n", int.parse("junk"));
    stdout.printf("%lld\n", int64.parse("9000000000"));
    stdout.printf("%u\n", (uint) uint64.parse("4000000000"));
    stdout.printf("%s\n", (255).to_string());
    stdout.printf("%s\n", (3.5).to_string());
    stdout.printf("%s\n", true.to_string());
    stdout.printf("%d %d\n", int.MAX, int.MIN);
    stdout.printf("%d\n", (int) 3.99);
    stdout.printf("%d\n", (int) Math.round(3.5));
    stdout.printf("%.3f\n", Math.sqrt(2.0));
    stdout.printf("%x %o\n", 255, 8);
    stdout.printf("%08.3f|%+d|%5d|%-5d|\n", 3.14159, 7, 42, 42);
}
