void main() {
    var list = new GLib.List<string>();
    list.append("Ada");
    list.append("Bob");
    list.append("Cleo");

    foreach (unowned string name in list) {
        stdout.printf("%s\n", name);
    }
    stdout.printf("count: %u\n", list.length());

    var scores = new GLib.HashTable<string, int>(str_hash, str_equal);
    scores["Ada"] = 88;
    scores["Bob"] = 72;
    scores["Cleo"] = 95;

    stdout.printf("Ada: %d\n", scores["Ada"]);
    stdout.printf("has Zed: %s\n", scores.contains("Zed").to_string());

    scores.foreach((name, score) => {
        stdout.printf("%s -> %d\n", name, score);
    });
}
