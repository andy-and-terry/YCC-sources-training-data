import std.stdio, std.algorithm, std.array;

struct Ver {
    int major, minor;
    int opCmp(const Ver o) const {
        return major != o.major ? major - o.major : minor - o.minor;
    }
}

void main() {
    auto v = [Ver(1, 2), Ver(0, 9), Ver(1, 0)];
    v.sort();
    writeln(v);
}
