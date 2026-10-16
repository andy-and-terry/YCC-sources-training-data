import std.stdio;

struct Version {
    int major, minor;

    int opCmp(const Version o) const {
        if (major != o.major) return major < o.major ? -1 : 1;
        if (minor != o.minor) return minor < o.minor ? -1 : 1;
        return 0;
    }

    bool opEquals(const Version o) const {
        return major == o.major && minor == o.minor;
    }
}

void main() {
    auto a = Version(1, 2);
    auto b = Version(1, 10);
    writeln(a < b);
    writeln(a == Version(1, 2));
    writeln(a >= b);
}
