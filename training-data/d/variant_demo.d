import std.stdio;
import std.variant;

void describe(Variant v) {
    if (v.type == typeid(int)) {
        writeln("int: ", v.get!int);
    } else if (v.type == typeid(string)) {
        writeln("string: ", v.get!string);
    } else if (v.type == typeid(double)) {
        writeln("double: ", v.get!double);
    } else {
        writeln("unknown type: ", v.type);
    }
}

void main() {
    Variant[] items = [Variant(42), Variant("hello"), Variant(3.5), Variant([1, 2])];
    foreach (item; items) describe(item);

    Variant v = 10;
    writeln(v.coerce!double + 0.5);
    v = "now a string";
    writeln(v.hasValue, " ", v.peek!string !is null);

    Algebraic!(int, string) a = 5;
    a.visit!((int i) => writeln("int ", i), (string s) => writeln("str ", s));
}
