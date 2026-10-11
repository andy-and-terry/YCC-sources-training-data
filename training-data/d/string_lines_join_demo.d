import std.stdio;
import std.string : lineSplitter, strip, join, splitLines;
import std.algorithm : map;
import std.array : array;

void main() {
    string text = "  alpha \n beta\n\n gamma  ";
    auto lines = text.lineSplitter.map!(l => l.strip).array;
    writeln(lines);
    writeln(lines.join("|"));
    writeln(text.splitLines.length);
}
