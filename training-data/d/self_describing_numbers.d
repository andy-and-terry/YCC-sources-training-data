import std.stdio;
import std.algorithm : count;
import std.conv : to;

bool isSelfDescribing(string s) {
    foreach (i, c; s)
        if (s.count(cast(char)('0' + i)) != c - '0') return false;
    return true;
}

void main() {
    foreach (s; ["1210", "2020", "21200", "1211"])
        writeln(s, " ", isSelfDescribing(s));
}
