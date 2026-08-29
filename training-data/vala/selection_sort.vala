int[] selection_sort(int[] items) {
    int[] arr = items;
    for (int i = 0; i < arr.length - 1; i++) {
        int minIdx = i;
        for (int j = i + 1; j < arr.length; j++) {
            if (arr[j] < arr[minIdx]) minIdx = j;
        }
        int temp = arr[i];
        arr[i] = arr[minIdx];
        arr[minIdx] = temp;
    }
    return arr;
}

void main() {
    int[] data = { 5, 3, 8, 1, 9, 2 };
    foreach (int x in selection_sort(data)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
