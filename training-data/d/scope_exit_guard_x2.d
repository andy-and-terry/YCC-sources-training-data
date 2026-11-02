import std.stdio;

void main() {
    writeln("start");
    scope(exit) writeln("cleanup");
    scope(failure) writeln("failed");
    writeln("work");
}
