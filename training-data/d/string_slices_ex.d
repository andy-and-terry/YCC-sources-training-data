import std.stdio, std.string;

void main() {
    string s = "hello world";
    writeln(s[0 .. 5]);
    writeln(s[$ - 5 .. $]);
    writeln(s.split(" "));
    writeln(s.indexOf("wor"));
    writeln(s.replace("o", "0"));
    writeln(format("%05d|%-6s|%.2f", 42, "ab", 3.14159));
}
