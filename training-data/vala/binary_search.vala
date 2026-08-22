int binary_search(int[] arr, int target) {
    int low = 0;
    int high = arr.length - 1;
    while (low <= high) {
        int mid = (low + high) / 2;
        if (arr[mid] == target) return mid;
        else if (arr[mid] < target) low = mid + 1;
        else high = mid - 1;
    }
    return -1;
}

void main() {
    int[] sorted = { 1, 3, 5, 7, 9, 11, 13 };
    stdout.printf("%d\n", binary_search(sorted, 7));
    stdout.printf("%d\n", binary_search(sorted, 4));
}
