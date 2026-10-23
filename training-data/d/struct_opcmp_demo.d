import std.stdio;
import std.algorithm : sort;

struct Version {
    int major, minor;
    int opCmp(const Version o) const {
        if (major != o.major) return major < o.major ? -1 : 1;
        if (minor != o.minor) return minor < o.minor ? -1 : 1;
        return 0;
    }
}

void main() {
    auto vs = [Version(1, 2), Version(0, 9), Version(1, 0)];
    sort(vs);
    writeln(vs);
    writeln(Version(1, 0) < Version(1, 1));
}
