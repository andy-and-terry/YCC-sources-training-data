import std.stdio, std.algorithm;

struct Ver {
    int major, minor;
    int opCmp(const Ver o) const {
        return major != o.major ? major - o.major : minor - o.minor;
    }
}

void main() {
    auto v = [Ver(1, 5), Ver(1, 2), Ver(0, 9)];
    v.sort();
    writeln(v);
}
