void dutch_national_flag_sort(int[] arr) {
    int low = 0, mid = 0, high = arr.length - 1;

    while (mid <= high) {
        if (arr[mid] == 0) {
            int tmp = arr[low];
            arr[low] = arr[mid];
            arr[mid] = tmp;
            low++;
            mid++;
        } else if (arr[mid] == 1) {
            mid++;
        } else {
            int tmp = arr[mid];
            arr[mid] = arr[high];
            arr[high] = tmp;
            high--;
        }
    }
}

void main() {
    int[] arr = { 2, 0, 2, 1, 1, 0 };
    dutch_national_flag_sort(arr);
    foreach (int v in arr) {
        stdout.printf("%d ", v);
    }
    stdout.printf("\n");
}
