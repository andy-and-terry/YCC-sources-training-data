void main() {
    try {
        var regex = new Regex("(\\w+)@(\\w+\\.\\w+)");
        MatchInfo info;

        if (regex.match("contact: ada@example.com", 0, out info)) {
            stdout.printf("user: %s\n", info.fetch(1));
            stdout.printf("domain: %s\n", info.fetch(2));
        }

        string text = "one, two,  three";
        var splitter = new Regex(",\\s*");
        string[] parts = splitter.split(text);
        foreach (string p in parts) {
            stdout.printf("part: %s\n", p);
        }
    } catch (RegexError e) {
        stdout.printf("regex error: %s\n", e.message);
    }
}
