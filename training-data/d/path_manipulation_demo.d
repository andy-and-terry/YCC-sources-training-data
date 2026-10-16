import std.stdio;
import std.path;

void main() {
    string p = "/home/user/docs/report.final.txt";
    writeln(baseName(p));
    writeln(dirName(p));
    writeln(extension(p));
    writeln(stripExtension(p));
    writeln(buildPath("a", "b", "c.txt"));
    writeln(setExtension("notes.txt", ".md"));
}
