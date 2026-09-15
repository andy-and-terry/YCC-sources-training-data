import std.stdio;

int[] zArray(string s) {
    int n = cast(int) s.length;
    auto z = new int[n];
    int left = 0, right = 0;

    foreach (i; 1 .. n) {
        if (i < right) {
            int remaining = right - i;
            int mirror = z[i - left];
            z[i] = mirror < remaining ? mirror : remaining;
        }
        while (i + z[i] < n && s[z[i]] == s[i + z[i]]) z[i]++;
        if (i + z[i] > right) {
            left = i;
            right = i + z[i];
        }
    }

    return z;
}

int[] zSearch(string text, string pattern) {
    auto combined = pattern ~ "\x01" ~ text;
    auto z = zArray(combined);
    int patLen = cast(int) pattern.length;
    int[] matches;

    foreach (i; 0 .. z.length) {
        if (z[i] == patLen) matches ~= cast(int) i - patLen - 1;
    }

    return matches;
}

void main() {
    writeln(zSearch("ababcababcabc", "abcab"));
    writeln(zSearch("aaaaa", "aa"));
}
