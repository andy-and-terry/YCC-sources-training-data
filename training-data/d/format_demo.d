import std.stdio;
import std.format;

void main() {
    writeln(format("%d + %d = %d", 2, 3, 2 + 3));
    writeln(format("%5.2f|", 3.14159));
    writeln(format("%-8s|%8s|", "left", "right"));
    writeln(format("%08.3f", 2.5));
    writeln(format("%x %X %o %b", 255, 255, 8, 5));
    writeln(format("%s", [1, 2, 3]));
    writeln(format("%(%s, %)", ["a", "b", "c"]));
    writeln(format("%2$s %1$s", "world", "hello"));
    writeln(format("%e", 12345.678));
    writeln(format("%c%c", 'O', 'K'));

    int n = 42;
    writefln("n is %s and hex is 0x%04x", n, n);
}
