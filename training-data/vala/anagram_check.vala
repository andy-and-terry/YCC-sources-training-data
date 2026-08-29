string normalize_str(string s) {
    var chars = new Gee.ArrayList<unichar>();
    var lower = s.down();
    for (int i = 0; i < lower.length; i++) {
        if (lower[i] != ' ') chars.add(lower[i]);
    }
    chars.sort();
    var sb = new StringBuilder();
    foreach (unichar c in chars) sb.append_unichar(c);
    return sb.str;
}

bool is_anagram(string a, string b) {
    return normalize_str(a) == normalize_str(b);
}

void main() {
    stdout.printf("%s\n", is_anagram("listen", "silent").to_string());
    stdout.printf("%s\n", is_anagram("hello", "world").to_string());
}
