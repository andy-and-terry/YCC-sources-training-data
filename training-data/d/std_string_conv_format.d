import std.stdio, std.string, std.conv, std.format, std.uni, std.array, std.algorithm;

void main() {
    string s = "Hello, World";
    writeln(s.toUpper, " ", s.toLower, " ", s.length, " ", s.indexOf("World"), " ", s.replace("l", "L"));
    writeln(s.split(", "), " ", s.strip, " ", s.leftJustify(15, '.'), "|", s.rightJustify(15, '.'));
    writeln("  pad  ".strip ~ "|", "abc".repeat(2).join, " ", s.startsWith("Hell"), s.endsWith("ld"));
    writeln(format("%05.1f|%-6s|%3d|%x|%s", 3.14159, "ab", 7, 255, [1, 2]));
    writeln(to!int("42") + 1, " ", to!string(3.5), " ", to!double("2.5") * 2, " ", to!string(255, 16));
    writeln("abc".representation.length, " ", "héllo".walkLength, " ", "héllo".length);
    writeln(s.capitalize, " ", "a-b-c".tr("-", "+"), " ", "snake_case".split('_').map!capitalize.join);
    writeln(s.count('l'), " ", s.chomp("d"), " ", "x=1".partition("="), " ", "ab".cmp("ac"));
    auto parts = "k1=v1;k2=v2".split(";").map!(p => p.split("=")).array;
    writeln(parts);
    writefln("%s has %d items totalling %.2f", "cart", 3, 29.5);
    writeln("dlang".dup.reverse, " ", "ünï".toUpper);
}
