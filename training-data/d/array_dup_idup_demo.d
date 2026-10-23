import std.stdio;

void main() {
    int[] a = [1, 2, 3];
    int[] alias_ = a;
    int[] copy = a.dup;

    a[0] = 99;
    writeln(alias_);
    writeln(copy);

    immutable(int)[] frozen = a.idup;
    writeln(frozen);

    string s = "hello";
    char[] mutableS = s.dup;
    mutableS[0] = 'J';
    writeln(mutableS);
    writeln(s);
}
