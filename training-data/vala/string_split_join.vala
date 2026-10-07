void main() {
    string csv = "red,green,,blue";
    string[] parts = csv.split(",");
    stdout.printf("%d parts\n", parts.length);

    string joined = string.joinv(" | ", parts);
    stdout.printf("%s\n", joined);

    string[] limited = "a=b=c".split("=", 2);
    stdout.printf("%s -> %s\n", limited[0], limited[1]);

    string text = "  padded text  ";
    stdout.printf("[%s] [%s]\n", text.strip(), text.up());
    stdout.printf("%s\n", "hello".replace("l", "L"));
    stdout.printf("%d %d\n", "hello".index_of("l"), "hello".last_index_of("l"));
    stdout.printf("%s\n", "hello world".substring(6));
    stdout.printf("%s\n", "abc".reverse());
}
