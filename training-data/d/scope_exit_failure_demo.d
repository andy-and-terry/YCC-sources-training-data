import std.stdio;

void work(bool fail) {
    scope(exit) writeln("cleanup");
    scope(success) writeln("ok");
    scope(failure) writeln("failed");
    if (fail) throw new Exception("boom");
}

void main() {
    work(false);
    try work(true);
    catch (Exception e) writeln("caught ", e.msg);
}
