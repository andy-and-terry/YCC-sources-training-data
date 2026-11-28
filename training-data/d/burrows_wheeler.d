import std.stdio;
import std.algorithm : sort, map;
import std.array : array;
import std.range : iota;

void main() {
    string s = "banana$";
    auto rots = iota(s.length).map!(i => s[i .. $] ~ s[0 .. i]).array;
    rots.sort();
    foreach (r; rots) write(r[$ - 1]);
    writeln();
}
