import std.stdio;

int calls;

int expensive() {
    calls++;
    return 100;
}

int orDefault(bool useIt, lazy int fallback) {
    return useIt ? 1 : fallback;
}

void logIf(bool enabled, lazy string msg) {
    if (enabled) writeln(msg);
}

void main() {
    writeln(orDefault(true, expensive()));
    writeln(calls);
    writeln(orDefault(false, expensive()));
    writeln(calls);

    logIf(false, "never built");
    logIf(true, "built on demand");
}
