import std.stdio;

void heapify(int[] arr, int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && arr[left] > arr[largest]) largest = left;
    if (right < n && arr[right] > arr[largest]) largest = right;

    if (largest != i) {
        auto tmp = arr[i];
        arr[i] = arr[largest];
        arr[largest] = tmp;
        heapify(arr, n, largest);
    }
}

int[] heapSort(int[] arr) {
    auto a = arr.dup;
    int n = cast(int) a.length;

    for (int i = n / 2 - 1; i >= 0; i--) heapify(a, n, i);

    for (int i = n - 1; i > 0; i--) {
        auto tmp = a[0];
        a[0] = a[i];
        a[i] = tmp;
        heapify(a, i, 0);
    }

    return a;
}

void main() {
    writeln(heapSort([5, 3, 8, 1, 9, 2]));
}
