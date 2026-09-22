int partition(int[] arr, int low, int high) {
    int pivot = arr[high];
    int i = low;
    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            int tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
            i++;
        }
    }
    int tmp = arr[i];
    arr[i] = arr[high];
    arr[high] = tmp;
    return i;
}

int quickselect(int[] arr, int low, int high, int k) {
    if (low == high) return arr[low];
    int pivotIndex = partition(arr, low, high);
    if (k == pivotIndex) {
        return arr[k];
    } else if (k < pivotIndex) {
        return quickselect(arr, low, pivotIndex - 1, k);
    } else {
        return quickselect(arr, pivotIndex + 1, high, k);
    }
}

void main() {
    int[] numbers = { 7, 10, 4, 3, 20, 15 };
    stdout.printf("%d\n", quickselect(numbers, 0, numbers.length - 1, 2));

    int[] numbers2 = { 7, 10, 4, 3, 20, 15 };
    stdout.printf("%d\n", quickselect(numbers2, 0, numbers2.length - 1, 0));
}
