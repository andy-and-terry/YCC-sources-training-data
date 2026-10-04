import std.stdio;
import std.traits;
import std.conv : to;

enum Color { red, green, blue }
enum Level : int { low = 1, mid = 5, high = 10 }

void main() {
    foreach (c; EnumMembers!Color)
        writeln(c, " = ", cast(int) c);

    writeln(Color.green.to!string);
    writeln("blue".to!Color);
    writeln(cast(Color) 0);

    static foreach (l; EnumMembers!Level)
        writefln("%s -> %d", l, l);

    writeln(EnumMembers!Level.length);
    writeln(is(OriginalType!Level == int));
    writeln(Level.max, " ", Level.min);
}
