void main() {
    string csv = "alpha,beta,gamma,delta";
    string[] parts = csv.split(",");
    stdout.printf("%d parts, first=%s, last=%s\n", parts.length, parts[0], parts[parts.length - 1]);

    string[] limited = csv.split(",", 2);
    stdout.printf("limited: %s | %s\n", limited[0], limited[1]);

    stdout.printf("%s\n", string.joinv(" + ", parts));

    string[] words = "  the   quick brown  fox ".strip().split(" ");
    int real_words = 0;
    foreach (string w in words) {
        if (w != "") real_words++;
    }
    stdout.printf("%d real words among %d fields\n", real_words, words.length);

    string text = "a-b_c-d";
    stdout.printf("%s\n", text.replace("-", " ").replace("_", " "));
    stdout.printf("%s\n", text.up());
    stdout.printf("%s\n", "MiXeD".down());
    stdout.printf("%s\n", "abc".reverse());
    stdout.printf("%s\n", "ab".concat("cd", "ef"));
    stdout.printf("%d\n", "hello world".index_of("world"));
    stdout.printf("%s\n", "hello".has_prefix("he").to_string());
    stdout.printf("%s\n", "hello".has_suffix("lo").to_string());
    stdout.printf("%s\n", "hello".substring(1, 3));
    stdout.printf("%c\n", "hello".get_char(1));
    stdout.printf("[%s]\n", "  padded  ".strip());
}
