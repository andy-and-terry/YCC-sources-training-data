void main() {
    string text = "the quick brown fox the lazy fox";
    var words = text.down().split(" ");
    var freq = new Gee.HashMap<string, int>();
    foreach (string word in words) {
        if (freq.has_key(word)) {
            freq[word] = freq[word] + 1;
        } else {
            freq[word] = 1;
        }
    }
    foreach (var entry in freq.entries) {
        stdout.printf("%s: %d\n", entry.key, entry.value);
    }
}
