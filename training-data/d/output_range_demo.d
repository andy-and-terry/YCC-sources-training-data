import std.stdio;
import std.range : isOutputRange;
import std.array : appender;

struct Accumulator {
    int total;

    void put(int value) {
        total += value;
    }
}

void fillWith(R)(ref R range, int[] values) if (isOutputRange!(R, int)) {
    foreach (v; values) range.put(v);
}

void main() {
    Accumulator acc;
    fillWith(acc, [1, 2, 3, 4, 5]);
    writeln(acc.total);

    auto app = appender!(int[]);
    fillWith(app, [10, 20, 30]);
    writeln(app.data);
}
