import std.stdio;

void process(bool shouldFail) {
    writeln("opening resource");

    scope(exit) writeln("closing resource");
    scope(failure) writeln("rolling back due to failure");
    scope(success) writeln("committed successfully");

    if (shouldFail) {
        throw new Exception("processing error");
    }

    writeln("processing complete");
}

void main() {
    try {
        process(false);
    } catch (Exception e) {
        writeln("caught: ", e.msg);
    }

    writeln("---");

    try {
        process(true);
    } catch (Exception e) {
        writeln("caught: ", e.msg);
    }
}
