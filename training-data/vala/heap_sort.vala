void sift_down(int[] a, int start, int end) {
    int root = start;
    while (2 * root + 1 <= end) {
        int child = 2 * root + 1;
        int swap_idx = root;
        if (a[swap_idx] < a[child]) swap_idx = child;
        if (child + 1 <= end && a[swap_idx] < a[child + 1]) swap_idx = child + 1;
        if (swap_idx == root) return;
        int temp = a[root];
        a[root] = a[swap_idx];
        a[swap_idx] = temp;
        root = swap_idx;
    }
}

int[] heap_sort(int[] arr) {
    int[] a = arr;
    int n = a.length;

    for (int start = n / 2 - 1; start >= 0; start--) {
        sift_down(a, start, n - 1);
    }

    for (int end = n - 1; end > 0; end--) {
        int temp = a[0];
        a[0] = a[end];
        a[end] = temp;
        sift_down(a, 0, end - 1);
    }

    return a;
}

void main() {
    int[] data = { 5, 2, 9, 1, 5, 6, 3, 8 };
    foreach (int x in heap_sort(data)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
