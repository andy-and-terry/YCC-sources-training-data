import std.stdio;
import std.algorithm : filter;
import std.array : array;

int[] quicksort(int[] items) {
    if (items.length <= 1) return items;
    auto pivot = items[$ / 2];
    auto left = items.filter!(x => x < pivot).array;
    auto mid = items.filter!(x => x == pivot).array;
    auto right = items.filter!(x => x > pivot).array;
    return quicksort(left) ~ mid ~ quicksort(right);
}

void main() {
    writeln(quicksort([5, 3, 8, 1, 9, 2]));
}
