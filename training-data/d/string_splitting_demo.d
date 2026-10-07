import std.stdio;
import std.string;
import std.algorithm;
import std.array;

void main() {
    string csv = "  name, age ,city ,  zip ";
    auto fields = csv.split(",").map!(s => s.strip).array;
    writeln(fields);

    writeln(fields.join(" | "));
    writeln("a-b-c".splitter('-').array);
    writeln("one two  three".split);
    writeln("key=value=more".findSplit("="));
    writeln("Hello".toUpper, " ", "Hello".toLower);
    writeln("abc".replace("b", "XX"));
    writeln("racecar".indexOf("cec"));
    writeln("  trim me  ".stripLeft, "|");
    writeln("line1\nline2\nline3".lineSplitter.array.length);
    writeln("abcdef".chunks(2).array);
}

import std.range : chunks;
