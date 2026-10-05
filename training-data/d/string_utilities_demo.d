import std.stdio;
import std.string;
import std.array;
import std.algorithm;
import std.uni : toUpper;

void main() {
    string s = "  The quick brown fox  ";
    writeln("[", s.strip, "]");

    auto words = s.split;
    writeln(words);
    writeln(words.join("-"));
    writeln(words.map!(w => w[0 .. 1].toUpper ~ w[1 .. $]).join(" "));

    writeln("hello".indexOf("ll"));
    writeln("a,b,,c".split(","));
    writeln("banana".replace("an", "AN"));
    writeln("abc".representation.length);
    writeln("Hello".startsWith("He"), " ", "Hello".endsWith("lo"));
    writeln(format("%5d|%-5s|%.3f", 42, "ab", 3.14159));
    writeln("x".leftJustify(4, '.'), "y".rightJustify(4, '.'));
}
