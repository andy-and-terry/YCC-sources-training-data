import std.stdio;
import std.algorithm : max;

int[] countingSort(int[] arr) {
    if (arr.length == 0) return arr;

    int maxVal = arr[0];
    foreach (v; arr) maxVal = max(maxVal, v);

    auto counts = new int[](maxVal + 1);
    foreach (v; arr) counts[v]++;

    int[] result;
    result.reserve(arr.length);
    foreach (value, count; counts) {
        foreach (_; 0 .. count) result ~= cast(int) value;
    }

    return result;
}

void main() {
    auto data = [5, 3, 8, 1, 9, 3, 5, 0, 2];
    writeln(countingSort(data));
}
