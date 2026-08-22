int[] bubble_sort(int[] arr) {
    int[] a = arr;
    for (int i = 0; i < a.length; i++) {
        for (int j = 0; j < a.length - i - 1; j++) {
            if (a[j] > a[j + 1]) {
                int temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
            }
        }
    }
    return a;
}

void main() {
    int[] data = { 5, 2, 9, 1, 5, 6 };
    foreach (int x in bubble_sort(data)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
