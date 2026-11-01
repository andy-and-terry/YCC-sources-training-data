import std.stdio;

void work(bool fail) {
    scope(exit) writeln("cleanup");
    scope(failure) writeln("failure path");
    scope(success) writeln("success path");
    if (fail) throw new Exception("boom");
}

void main() {
    work(false);
    try work(true); catch (Exception e) writeln(e.msg);
}
