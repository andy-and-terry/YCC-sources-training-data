void main() {
    string name = "Ada";
    int age = 36;
    stdout.printf("%s is %d years old\n", name, age);
    print(@"Inline: $name will be $(age + 1) next year\n");
    string padded = "%05d|%-6s|%6.2f".printf(42, "ab", 3.14159);
    print("%s\n", padded);
    print("%s\n", string.joinv(", ", {"a", "b", "c"}));
}
