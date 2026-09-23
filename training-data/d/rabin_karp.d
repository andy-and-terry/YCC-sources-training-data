import std.stdio;

int rabinKarpSearch(string text, string pattern) {
    immutable int base = 256;
    immutable int mod = 101;
    auto n = text.length;
    auto m = pattern.length;
    if (m == 0 || m > n) return -1;

    int patternHash = 0;
    int windowHash = 0;
    int h = 1;

    foreach (i; 0 .. m - 1) h = (h * base) % mod;

    foreach (i; 0 .. m) {
        patternHash = (base * patternHash + pattern[i]) % mod;
        windowHash = (base * windowHash + text[i]) % mod;
    }

    foreach (i; 0 .. n - m + 1) {
        if (patternHash == windowHash && text[i .. i + m] == pattern) {
            return cast(int) i;
        }
        if (i < n - m) {
            windowHash = (base * (windowHash - text[i] * h) + text[i + m]) % mod;
            if (windowHash < 0) windowHash += mod;
        }
    }

    return -1;
}

void main() {
    auto text = "abxabcabcaby";
    auto pattern = "abcaby";
    writeln(rabinKarpSearch(text, pattern));
    writeln(rabinKarpSearch(text, "notfound"));
}
