import std.stdio;

void main() {
    static foreach (i; 1 .. 4) {
        mixin("int v" ~ cast(char)('0' + i) ~ " = i * 10;");
    }
    writeln(v1, " ", v2, " ", v3);

    static foreach (T; AliasSeq!(int, long, double))
        writeln(T.stringof, " size ", T.sizeof);
}

import std.meta : AliasSeq;
