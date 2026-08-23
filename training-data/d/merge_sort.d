import std.stdio;
import std.array;

int[] mergeSort(int[] arr) {
    if (arr.length <= 1) return arr;
    auto mid = arr.length / 2;
    auto left = mergeSort(arr[0 .. mid]);
    auto right = mergeSort(arr[mid .. $]);
    return merge(left, right);
}

int[] merge(int[] left, int[] right) {
    int[] result;
    size_t i = 0, j = 0;
    while (i < left.length && j < right.length) {
        if (left[i] <= right[j]) result ~= left[i++];
        else result ~= right[j++];
    }
    result ~= left[i .. $];
    result ~= right[j .. $];
    return result;
}

void main() {
    writeln(mergeSort([5, 2, 9, 1, 5, 6]));
}
