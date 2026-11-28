import std.stdio;

string[] duval(string s) {
    string[] res;
    size_t i = 0, n = s.length;
    while (i < n) {
        size_t j = i + 1, k = i;
        while (j < n && s[k] <= s[j]) { k = s[k] < s[j] ? i : k + 1; j++; }
        while (i <= k) { res ~= s[i .. i + j - k]; i += j - k; }
    }
    return res;
}

void main() { writeln(duval("banana")); }
