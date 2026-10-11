import std.stdio;
import std.format : format;

void main() {
    string name = "Ada";
    int year = 1843;
    string s = format("%s wrote notes in %d", name, year);
    writeln(s);
    writeln(format("%08.3f|%-6s|%6s|", 3.14159, "ab", "cd"));
    writeln(format("%(%s, %)", [1, 2, 3]));
    writeln(format("%x %X %o", 255, 255, 8));
}
