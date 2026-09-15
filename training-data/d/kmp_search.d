import std.stdio;

int[] buildLps(string pattern) {
    auto lps = new int[pattern.length];
    size_t len = 0;
    size_t i = 1;
    while (i < pattern.length) {
        if (pattern[i] == pattern[len]) {
            len++;
            lps[i] = cast(int) len;
            i++;
        } else if (len != 0) {
            len = lps[len - 1];
        } else {
            lps[i] = 0;
            i++;
        }
    }
    return lps;
}

int kmpSearch(string text, string pattern) {
    if (pattern.length == 0) return 0;
    auto lps = buildLps(pattern);
    size_t i = 0;
    size_t j = 0;
    while (i < text.length) {
        if (text[i] == pattern[j]) {
            i++;
            j++;
            if (j == pattern.length) return cast(int)(i - j);
        } else if (j != 0) {
            j = lps[j - 1];
        } else {
            i++;
        }
    }
    return -1;
}

void main() {
    writeln(kmpSearch("abxabcabcaby", "abcaby"));
    writeln(kmpSearch("hello world", "world"));
    writeln(kmpSearch("hello world", "xyz"));
}
