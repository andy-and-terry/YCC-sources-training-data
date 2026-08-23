import std.stdio;

void main() {
    int[string] scores = ["Ada": 88, "Bob": 72, "Cleo": 95];
    foreach (name, score; scores) {
        writeln(name, ": ", score);
    }
    writeln("Ada" in scores ? "found" : "not found");
}
