import std.stdio;

void work(bool fail) {
    writeln("begin");
    scope(exit) writeln("exit");
    scope(success) writeln("success");
    scope(failure) writeln("failure");
    if (fail) throw new Exception("boom");
}

void main() {
    work(false);
    try work(true);
    catch (Exception e) writeln("caught ", e.msg);
}
