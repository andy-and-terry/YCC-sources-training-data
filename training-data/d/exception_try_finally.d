import std.stdio;

void main() {
    try {
        throw new Exception("bad thing");
    } catch (Exception e) {
        writeln("caught: ", e.msg);
    } finally {
        writeln("done");
    }
}
