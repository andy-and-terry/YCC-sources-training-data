import std.stdio;

int modInverse(int a, int m) {
    foreach (x; 1 .. m) if (a * x % m == 1) return x;
    return 0;
}

string affine(string s, int a, int b, bool decrypt = false) {
    int inv = modInverse(a, 26);
    char[] o;
    foreach (ch; s) {
        if (ch >= 'A' && ch <= 'Z') {
            int x = ch - 'A';
            int y = decrypt ? ((inv * (x - b)) % 26 + 26) % 26 : (a * x + b) % 26;
            o ~= cast(char)('A' + y);
        } else o ~= ch;
    }
    return o.idup;
}

void main() {
    auto c = affine("AFFINE", 5, 8);
    writeln(c, " ", affine(c, 5, 8, true));
}
