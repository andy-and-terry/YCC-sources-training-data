int binary_search(int[] arr, int low, int high, int target) {
    if (low > high) return -1;
    int mid = (low + high) / 2;
    if (arr[mid] == target) return mid;
    if (arr[mid] < target) return binary_search(arr, mid + 1, high, target);
    return binary_search(arr, low, mid - 1, target);
}

void main() {
    int[] data = { 1, 3, 5, 7, 9, 11 };
    stdout.printf("%d\n", binary_search(data, 0, data.length - 1, 7));
}
