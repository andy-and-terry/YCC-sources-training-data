import std.stdio;

enum size = 4;

pragma(msg, "compiling with size = ", size);

static assert(size > 0, "size must be positive");

int[size] makeTable()
{
    int[size] t;
    foreach (i, ref v; t)
        v = cast(int)(i * i);
    return t;
}

pragma(inline, true)
int twice(int x) { return x * 2; }

void main()
{
    writeln(makeTable());
    writeln(twice(21));
    writeln(__FILE__ ~ ":" ~ __LINE__.stringof);
}
