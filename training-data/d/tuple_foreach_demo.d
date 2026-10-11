import std.stdio;
import std.typecons : tuple;

void main() {
    auto t = tuple(1, "two", 3.0);
    foreach (i, v; t.expand)
        writeln(i, ": ", v);
    writeln(t.length);
    auto named = tuple!("id", "name")(7, "x");
    writeln(named.id, " ", named.name);
}
