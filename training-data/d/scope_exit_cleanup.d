import std.stdio;

void main() {
    writeln("start");
    scope(exit) writeln("exit 1");
    scope(exit) writeln("exit 2");
    scope(failure) writeln("not printed");
    writeln("end");
}
