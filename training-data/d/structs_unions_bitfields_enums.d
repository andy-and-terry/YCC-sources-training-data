import std.stdio, std.bitmanip, std.typecons;

enum Color : ubyte { red = 1, green, blue }

struct Packet {
    mixin(bitfields!(
        uint, "version", 3,
        uint, "flags", 5,
        uint, "", 0));
    ushort length;
}

union IntOrBytes { uint i; ubyte[4] b; }

struct Point { int x, y; Point opBinary(string op : "+")(Point o) const { return Point(x + o.x, y + o.y); } }

void main() {
    Packet p;
    p.version = 5; p.flags = 17; p.length = 300;
    writeln(p.version, " ", p.flags, " ", p.length, " ", Packet.sizeof);
    IntOrBytes u;
    u.i = 0x01020304;
    writeln(u.b);
    writeln(Color.blue, " ", cast(int) Color.green, " ", cast(Color) 1);
    writeln(Point(1, 2) + Point(3, 4));
    auto t = tuple(1, "two", 3.0);
    writeln(t[1], " ", t.length);
    Nullable!int maybe;
    writeln(maybe.isNull, " ", maybe.get(5));
    maybe = 3;
    writeln(maybe, " ", maybe.get);
    auto named = tuple!("x", "y")(10, 20);
    writeln(named.x + named.y);
    foreach (c; [EnumMembers!Color]) write(c, ' ');
    writeln();
}
