import std.stdio;
import std.variant;

void main() {
    Variant v = 42;
    writeln(v.type);
    writeln(v.get!int);

    v = "hello";
    writeln(v.type);
    writeln(v.get!string);

    v = 3.5;
    if (v.peek!double) writeln("double ", *v.peek!double);
    writeln(v.convertsTo!int);

    Variant[] bag = [Variant(1), Variant("two"), Variant(3.0)];
    foreach (item; bag)
        writeln(item.type, " -> ", item);
}
