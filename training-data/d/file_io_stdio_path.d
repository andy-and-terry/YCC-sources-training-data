import std.stdio, std.file, std.path, std.algorithm, std.array, std.string;

void main() {
    auto dir = buildPath(tempDir, "d_demo");
    mkdirRecurse(dir);
    auto f = buildPath(dir, "a.txt");
    std.file.write(f, "one\ntwo\nthree\n");
    append(f, "four\n");
    writeln(readText(f).splitLines.length, " ", getSize(f), " ", exists(f), " ", isFile(f));
    foreach (line; File(f).byLine) writeln(line.idup.toUpper);
    auto fh = File(buildPath(dir, "b.txt"), "w");
    fh.writeln("x=1");
    fh.writefln("%d,%s", 2, "y");
    fh.close();
    writeln(readText(buildPath(dir, "b.txt")).strip.split("\n"));
    writeln(dirEntries(dir, "*.txt", SpanMode.shallow).map!(e => baseName(e.name)).array.sort().array);
    writeln(baseName(f), " ", extension(f), " ", stripExtension(f).endsWith("a"), " ", dirName("/x/y/z.txt"));
    rename(f, buildPath(dir, "c.txt"));
    writeln(exists(f), exists(buildPath(dir, "c.txt")));
    rmdirRecurse(dir);
    writeln(exists(dir));
}
