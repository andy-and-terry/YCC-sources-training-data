import std.stdio;
import std.file;
import std.string : strip;
import std.algorithm : map;
import std.conv : to;

void main() {
    enum path = "d_file_io_demo.tmp";

    write(path, "10\n20\n30\n");
    append(path, "40\n");

    writeln(exists(path));
    writeln(getSize(path));

    auto numbers = readText(path).strip.splitLines;
    int total;
    foreach (line; numbers)
        total += line.to!int;
    writeln("total = ", total);

    auto f = File(path, "r");
    int n;
    foreach (line; f.byLine)
        writefln("%d: %s", ++n, line);
    f.close();

    remove(path);
    writeln(exists(path));
}

import std.string : splitLines;
