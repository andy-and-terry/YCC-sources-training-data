import std.stdio;

string longestPalindrome(string s) {
    if (s.length == 0) return "";

    size_t start = 0, maxLen = 1;

    void expand(long left, long right) {
        while (left >= 0 && right < cast(long) s.length && s[left] == s[right]) {
            if (cast(size_t)(right - left + 1) > maxLen) {
                start = cast(size_t) left;
                maxLen = cast(size_t)(right - left + 1);
            }
            left--;
            right++;
        }
    }

    foreach (i; 0 .. s.length) {
        expand(i, i);
        expand(i, i + 1);
    }

    return s[start .. start + maxLen];
}

void main() {
    writeln(longestPalindrome("babad"));
    writeln(longestPalindrome("cbbd"));
}
