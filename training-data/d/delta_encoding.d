import std.stdio;

int[] encode(int[] xs) {
    auto d = xs.dup;
    foreach (i; 1 .. xs.length) d[i] = xs[i] - xs[i - 1];
    return d;
}

int[] decode(int[] ds) {
    auto o = ds.dup;
    foreach (i; 1 .. ds.length) o[i] = o[i - 1] + ds[i];
    return o;
}

void main() {
    auto d = encode([10, 12, 15, 15, 20]);
    writeln(d);
    writeln(decode(d));
}
