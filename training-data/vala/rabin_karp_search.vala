int rabin_karp_search(string text, string pattern) {
    int n = text.length;
    int m = pattern.length;
    if (m == 0 || m > n) {
        return -1;
    }

    int prime = 101;
    int base = 256;
    int pattern_hash = 0;
    int text_hash = 0;
    int h = 1;

    for (int i = 0; i < m - 1; i++) {
        h = (h * base) % prime;
    }

    for (int i = 0; i < m; i++) {
        pattern_hash = (base * pattern_hash + pattern[i]) % prime;
        text_hash = (base * text_hash + text[i]) % prime;
    }

    for (int i = 0; i <= n - m; i++) {
        if (pattern_hash == text_hash) {
            bool match = true;
            for (int j = 0; j < m; j++) {
                if (text[i + j] != pattern[j]) {
                    match = false;
                    break;
                }
            }
            if (match) {
                return i;
            }
        }
        if (i < n - m) {
            text_hash = (base * (text_hash - text[i] * h) + text[i + m]) % prime;
            if (text_hash < 0) {
                text_hash += prime;
            }
        }
    }
    return -1;
}

void main() {
    stdout.printf("%d\n", rabin_karp_search("abxabcabcaby", "abcaby"));
    stdout.printf("%d\n", rabin_karp_search("hello world", "world"));
    stdout.printf("%d\n", rabin_karp_search("hello world", "xyz"));
}
