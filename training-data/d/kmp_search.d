import std.stdio;

int[] buildFailure(string pattern) {
    auto fail = new int[](pattern.length);
    int k = 0;
    for (size_t i = 1; i < pattern.length; i++) {
        while (k > 0 && pattern[k] != pattern[i]) k = fail[k - 1];
        if (pattern[k] == pattern[i]) k++;
        fail[i] = k;
    }
    return fail;
}

int[] kmpSearch(string text, string pattern) {
    int[] matches;
    if (pattern.length == 0) return matches;

    auto fail = buildFailure(pattern);
    int k = 0;

    for (size_t i = 0; i < text.length; i++) {
        while (k > 0 && pattern[k] != text[i]) k = fail[k - 1];
        if (pattern[k] == text[i]) k++;
        if (k == pattern.length) {
            matches ~= cast(int)(i - pattern.length + 1);
            k = fail[k - 1];
        }
    }

    return matches;
}

void main() {
    writeln(kmpSearch("ababcabcabababd", "ababd"));
}
