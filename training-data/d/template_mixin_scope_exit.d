import std.stdio;
void main() {
    scope(exit) writeln("bye");
    scope(failure) writeln("failed");
    writeln("working");
}
