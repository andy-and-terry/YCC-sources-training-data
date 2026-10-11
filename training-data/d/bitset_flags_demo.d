import std.stdio;

enum Perm : ubyte {
    none = 0,
    read = 1 << 0,
    write = 1 << 1,
    exec = 1 << 2,
}

bool has(ubyte flags, Perm p) {
    return (flags & p) != 0;
}

void main() {
    ubyte flags = Perm.read | Perm.write;
    writeln(has(flags, Perm.read));
    writeln(has(flags, Perm.exec));
    flags |= Perm.exec;
    flags &= ~Perm.write;
    writefln("%03b", flags);
}
