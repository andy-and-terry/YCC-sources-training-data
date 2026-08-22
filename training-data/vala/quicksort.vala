int[] quicksort(int[] items) {
    if (items.length <= 1) return items;
    int pivot = items[items.length / 2];
    int[] left = {};
    int[] mid = {};
    int[] right = {};
    foreach (int x in items) {
        if (x < pivot) left += x;
        else if (x == pivot) mid += x;
        else right += x;
    }
    int[] result = quicksort(left);
    foreach (int x in mid) result += x;
    foreach (int x in quicksort(right)) result += x;
    return result;
}

void main() {
    int[] data = { 5, 3, 8, 1, 9, 2 };
    foreach (int x in quicksort(data)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
