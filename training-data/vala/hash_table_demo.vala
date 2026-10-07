void main() {
    var ages = new HashTable<string, int>(str_hash, str_equal);
    ages.insert("alice", 30);
    ages.insert("bob", 25);
    ages["carol"] = 41;

    stdout.printf("size: %u\n", ages.size());
    stdout.printf("bob: %d\n", ages["bob"]);
    stdout.printf("has dave: %s\n", ages.contains("dave").to_string());

    ages.remove("bob");
    var keys = new List<string>();
    ages.foreach((k, v) => {
        keys.insert_sorted(k, strcmp);
    });
    foreach (string k in keys) {
        stdout.printf("%s=%d\n", k, ages[k]);
    }
}
