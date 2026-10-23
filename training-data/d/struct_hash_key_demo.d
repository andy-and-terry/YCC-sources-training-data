import std.stdio;

struct Key
{
    int a;
    string b;

    size_t toHash() const @safe nothrow
    {
        return typeid(a).getHash(&a) * 31 + typeid(b).getHash(&b);
    }

    bool opEquals(const Key other) const
    {
        return a == other.a && b == other.b;
    }
}

void main()
{
    int[Key] table;
    table[Key(1, "x")] = 10;
    table[Key(2, "y")] = 20;
    table[Key(1, "x")] += 5;

    writeln(table[Key(1, "x")]);
    writeln(table.length);
    writeln(Key(2, "y") in table ? "found" : "missing");
    writeln(Key(3, "z") in table ? "found" : "missing");
}
