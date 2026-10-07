import std.stdio;
import std.format;

void main() {
    writefln("%5d|%-5d|%05d", 42, 42, 42);
    writefln("%.2f %e", 3.14159, 12345.678);
    writefln("%x %X %o %b", 255, 255, 8, 5);
    writefln("%s %s", "text", [1, 2, 3]);
    writefln("%(%s, %)", [1, 2, 3]);
    writefln("%2$s %1$s", "world", "hello");
    string s = format("%08.3f", 3.14159);
    writeln(s);
    writeln(format("%c%c", 'O', 'K'));
    writeln(format("%(%s%)", [1, 2]));
}
