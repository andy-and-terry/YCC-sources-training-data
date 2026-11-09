import std.stdio;

void main() {
    scope(exit) writeln("exit");
    scope(failure) writeln("failure");
    scope(success) writeln("success");
    writeln("body");
}
