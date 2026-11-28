import std.stdio;

void main() {
    writeln("start");
    {
        scope(exit) writeln("exit 1");
        scope(success) writeln("success");
        scope(failure) writeln("failure");
        writeln("body");
    }
}
