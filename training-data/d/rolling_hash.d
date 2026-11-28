import std.stdio;

void main() {
    string s = "abcabc";
    enum k = 3, B = 31, M = 1_000_003;
    long pw = 1, h = 0;
    foreach (_; 1 .. k) pw = pw * B % M;
    foreach (c; s[0 .. k]) h = (h * B + c) % M;
    writeln(0, " ", h);
    foreach (i; 1 .. s.length - k + 1) {
        h = (h - s[i - 1] * pw % M + M) % M;
        h = (h * B + s[i + k - 1]) % M;
        writeln(i, " ", h);
    }
}
