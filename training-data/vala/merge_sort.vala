int[] merge_arrays(int[] left, int[] right) {
    int[] result = {};
    int i = 0, j = 0;
    while (i < left.length && j < right.length) {
        if (left[i] <= right[j]) {
            result += left[i];
            i++;
        } else {
            result += right[j];
            j++;
        }
    }
    while (i < left.length) { result += left[i]; i++; }
    while (j < right.length) { result += right[j]; j++; }
    return result;
}

int[] merge_sort(int[] items) {
    if (items.length <= 1) return items;
    int mid = items.length / 2;
    int[] left = items[0:mid];
    int[] right = items[mid:items.length];
    return merge_arrays(merge_sort(left), merge_sort(right));
}

void main() {
    int[] data = { 5, 2, 9, 1, 5, 6 };
    foreach (int x in merge_sort(data)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
