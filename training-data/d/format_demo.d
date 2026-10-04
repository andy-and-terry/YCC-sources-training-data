import std.stdio;
import std.format;
import std.conv : to;

void main() {
    writeln(format("%5d|%-5d|%05d", 42, 42, 42));
    writeln(format("%.3f %e", 3.14159265, 12345.678));
    writeln(format("%x %X %o %b", 255, 255, 8, 5));
    writeln(format("%s has %s items", "cart", 3));
    writeln(format("%10s|%-10s|", "right", "left"));
    writeln(format("%(%d, %)", [1, 2, 3]));
    writeln(format("%s", [1: "one", 2: "two"]));
    writeln(format("%2$s %1$s", "world", "hello"));
    writefln("%*d", 6, 7);
    writeln(12.to!string ~ "px");
    writeln("3.5".to!double + 1);
}
