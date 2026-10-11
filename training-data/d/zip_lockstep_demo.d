import std.stdio;
import std.range : zip, lockstep;

void main() {
    auto names = ["ann", "bob", "cy"];
    auto ages = [31, 25, 47];

    foreach (pair; zip(names, ages))
        writeln(pair[0], " is ", pair[1]);

    foreach (i, name, age; lockstep(names, ages))
        writefln("%d: %s=%d", i, name, age);
}
