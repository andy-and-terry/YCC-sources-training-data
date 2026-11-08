import std.stdio;
import std.algorithm : map;
import std.conv : to;

string rot47(string s) {
    char[] o;
    foreach (c; s)
        o ~= (c >= 33 && c <= 126) ? cast(char)(33 + (c - 33 + 47) % 94) : c;
    return o.idup;
}

void main() {
    auto e = rot47("Hello, World!");
    writeln(e);
    writeln(rot47(e));
}
