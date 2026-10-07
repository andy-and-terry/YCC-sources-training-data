import std.stdio;

int calls;

int expensive() {
    ++calls;
    writeln("computing...");
    return 42;
}

int orDefault(bool useDefault, lazy int fallback) {
    return useDefault ? fallback : 0;
}

void logIf(bool enabled, lazy string msg) {
    if (enabled)
        writeln("LOG: ", msg);
}

void main() {
    writeln(orDefault(false, expensive()));
    writeln(calls);
    writeln(orDefault(true, expensive()));
    writeln(calls);

    logIf(false, "never built " ~ "string");
    logIf(true, "built on demand");
}
