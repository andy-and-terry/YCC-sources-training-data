int[] insertion_sort(int[] items) {
    int[] arr = items;
    for (int i = 1; i < arr.length; i++) {
        int key = arr[i];
        int j = i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
    return arr;
}

void main() {
    int[] data = { 12, 11, 13, 5, 6 };
    foreach (int x in insertion_sort(data)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
