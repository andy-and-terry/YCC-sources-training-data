import std.stdio;
import std.traits;

struct Point
{
    int x;
    double y;
    string label;

    void move(int dx) { x += dx; }
}

int square(int n) { return n * n; }

void main()
{
    static foreach (name; __traits(allMembers, Point))
        writeln("member: ", name);

    writeln(FieldNameTuple!Point);
    writeln(Fields!Point.stringof);
    writeln(__traits(hasMember, Point, "move"));
    writeln(__traits(hasMember, Point, "nothing"));
    writeln(ReturnType!square.stringof);
    writeln(Parameters!square.stringof);
    writeln(isIntegral!int, " ", isFloatingPoint!int);
    writeln(__traits(identifier, square));
}
