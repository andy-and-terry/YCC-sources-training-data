bool is_palindrome(string s) {
    var normalized = new StringBuilder();
    var lower = s.down();
    for (int i = 0; i < lower.length; i++) {
        unichar c = lower[i];
        if (c.isalnum()) normalized.append_unichar(c);
    }
    string original = normalized.str;
    string reversed = original.reverse();
    return original == reversed;
}

void main() {
    stdout.printf("%s\n", is_palindrome("A man, a plan, a canal: Panama").to_string());
    stdout.printf("%s\n", is_palindrome("hello").to_string());
}
