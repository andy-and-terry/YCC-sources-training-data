import std.stdio;

int evaluations = 0;

int expensive() {
    ++evaluations;
    writeln("computing...");
    return 42;
}

int pick(bool useValue, lazy int value) {
    if (useValue)
        return value + value;
    return 0;
}

void logIf(bool enabled, lazy string message) {
    if (enabled)
        writeln("LOG: ", message);
}

void main() {
    writeln(pick(false, expensive()));
    writeln("evaluations so far: ", evaluations);
    writeln(pick(true, expensive()));
    writeln("evaluations so far: ", evaluations);

    logIf(false, "never built");
    logIf(true, "built on demand");
}
