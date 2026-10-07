int rabin_karp_search(string text, string pattern) {
    int n = text.length;
    int m = pattern.length;
    if (m == 0 || m > n) return -1;

    int radix = 256;
    int prime = 101;
    int pattern_hash = 0;
    int text_hash = 0;
    int high_order = 1;

    for (int i = 0; i < m - 1; i++) {
        high_order = (high_order * radix) % prime;
    }

    for (int i = 0; i < m; i++) {
        pattern_hash = (radix * pattern_hash + (int) pattern[i]) % prime;
        text_hash = (radix * text_hash + (int) text[i]) % prime;
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
            if (match) return i;
        }

        if (i < n - m) {
            text_hash = (radix * (text_hash - (int) text[i] * high_order) + (int) text[i + m]) % prime;
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
