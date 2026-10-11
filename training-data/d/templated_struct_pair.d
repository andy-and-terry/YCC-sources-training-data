import std.stdio;

struct Pair(A, B) {
    A first;
    B second;

    Pair!(B, A) swap() {
        return Pair!(B, A)(second, first);
    }
}

void main() {
    auto p = Pair!(int, string)(7, "seven");
    writeln(p);
    writeln(p.swap());
}
