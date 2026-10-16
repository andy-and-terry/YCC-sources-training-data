import std.stdio;
import std.conv : to;
import std.string : strip;

void main() {
    long total;
    foreach (line; stdin.byLine) {
        auto s = line.idup.strip;
        if (s.length) total += s.to!long;
    }
    writeln("sum = ", total);
}
