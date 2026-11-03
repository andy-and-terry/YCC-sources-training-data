import std.stdio, std.algorithm, std.array;

int[] modes(int[] items) {
    int[int] counts;
    foreach (x; items) counts[x]++;
    int top = counts.values.maxElement;
    return counts.byKeyValue.filter!(kv => kv.value == top).map!(kv => kv.key).array.sort.release;
}

void main() {
    writeln(modes([1, 2, 2, 3, 3, 4]));
}
