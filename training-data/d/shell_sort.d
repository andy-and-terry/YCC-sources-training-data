import std.stdio;

void shellSort(int[] arr) {
    auto n = arr.length;
    for (size_t gap = n / 2; gap > 0; gap /= 2) {
        for (size_t i = gap; i < n; i++) {
            int temp = arr[i];
            size_t j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
    }
}

void main() {
    int[] data = [12, 34, 54, 2, 3, 89, 1, 45];
    shellSort(data);
    writeln(data);
}
