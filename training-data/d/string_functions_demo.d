import std.stdio;
import std.string;
import std.array : array, join;
import std.algorithm : map;
import std.uni : toUpper;

void main() {
    string text = "  The quick brown fox  ";
    string trimmed = text.strip();
    writeln("[", trimmed, "]");
    writeln(trimmed.toUpper());
    writeln(trimmed.split(" ").length);
    writeln(trimmed.replace("quick", "slow"));
    writeln(trimmed.indexOf("brown"));
    writeln(trimmed.startsWith("The"));
    writeln(trimmed.capitalize());
    writeln(trimmed.split().map!(w => w[0 .. 1]).join());
    writeln(leftJustify("id", 6, '.'), rightJustify("42", 6, '.'));
    writeln(trimmed.representation.length);
}
