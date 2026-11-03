import std.stdio, std.uni, std.algorithm, std.conv;

string swapCase(string s) {
    return s.map!(c => c.isUpper ? c.toLower : c.toUpper).to!string;
}

void main() {
    writeln(swapCase("Hello World 42"));
}
