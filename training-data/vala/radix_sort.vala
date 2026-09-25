int get_max(int[] values) {
    int max = values[0];
    foreach (int v in values) {
        if (v > max) max = v;
    }
    return max;
}

void counting_sort_by_digit(int[] values, int exp) {
    int n = values.length;
    int[] output = new int[n];
    int[] counts = new int[10];

    for (int i = 0; i < n; i++) {
        int digit = (values[i] / exp) % 10;
        counts[digit]++;
    }
    for (int i = 1; i < 10; i++) {
        counts[i] += counts[i - 1];
    }
    for (int i = n - 1; i >= 0; i--) {
        int digit = (values[i] / exp) % 10;
        counts[digit]--;
        output[counts[digit]] = values[i];
    }
    for (int i = 0; i < n; i++) {
        values[i] = output[i];
    }
}

void radix_sort(int[] values) {
    int max = get_max(values);
    for (int exp = 1; max / exp > 0; exp *= 10) {
        counting_sort_by_digit(values, exp);
    }
}

void main() {
    int[] values = { 170, 45, 75, 90, 802, 24, 2, 66 };
    radix_sort(values);
    foreach (int v in values) {
        stdout.printf("%d ", v);
    }
    stdout.printf("\n");
}
