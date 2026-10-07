import std.stdio;
import std.string;
import std.array : split, join;
import std.uni : toUpper;

void main() {
    string s = "  Hello, D World  ";
    writeln(s.strip());
    writeln(s.strip.toUpper);
    writeln(s.strip.split(", "));
    writeln(["a", "b", "c"].join("-"));
    writeln("banana".replace("an", "AN"));
    writeln("banana".indexOf("nan"));
    writeln("banana".count('a'));
    writeln("hello".capitalize);
    writeln("abc".leftJustify(6, '.') ~ "|");
    writeln("x=1;y=2".split(";"));
    writeln("racecar".representation.length);
}
