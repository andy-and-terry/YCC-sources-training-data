bool pair_with_sum(int[] sorted, int target, out int a, out int b) {
    int left = 0;
    int right = sorted.length - 1;
    a = 0;
    b = 0;
    while (left < right) {
        int sum = sorted[left] + sorted[right];
        if (sum == target) {
            a = sorted[left];
            b = sorted[right];
            return true;
        }
        if (sum < target) left++; else right--;
    }
    return false;
}

void main() {
    int[] data = { 1, 3, 4, 6, 8, 11 };
    int x, y;
    if (pair_with_sum(data, 10, out x, out y)) {
        stdout.printf("%d + %d = 10\n", x, y);
    }
    stdout.printf("%s\n", pair_with_sum(data, 100, out x, out y) ? "found" : "none");
}
