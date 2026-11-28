import std.stdio;
import std.algorithm : sort, map;
import std.range : iota;
import std.array : array;

size_t[] order(size_t n, size_t k) {
    size_t cycle = 2 * (k - 1);
    size_t rail(size_t i) { auto r = i % cycle; return r < k ? r : cycle - r; }
    return iota(n).array.sort!((a, b) => rail(a) < rail(b) || (rail(a) == rail(b) && a < b)).release;
}

string encrypt(string t, size_t k) {
    char[] o;
    foreach (i; order(t.length, k)) o ~= t[i];
    return o.idup;
}

string decrypt(string c, size_t k) {
    auto o = new char[c.length];
    foreach (pos, i; order(c.length, k)) o[i] = c[pos];
    return o.idup;
}

void main() {
    auto c = encrypt("WEAREDISCOVERED", 3);
    writeln(c, " ", decrypt(c, 3));
}
