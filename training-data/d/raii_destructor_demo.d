import std.stdio;

struct Resource
{
    string name;

    this(string n)
    {
        name = n;
        writeln("acquire ", name);
    }

    ~this()
    {
        writeln("release ", name);
    }

    @disable this(this);   // forbid copying
}

void main()
{
    writeln("enter main");
    {
        auto a = Resource("A");
        auto b = Resource("B");
        writeln("in scope");
    }                       // destroyed in reverse order: B then A
    writeln("leave main");
}
