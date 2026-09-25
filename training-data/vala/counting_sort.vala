int[] counting_sort(int[] values, int max_value) {
    int[] counts = new int[max_value + 1];
    foreach (int v in values) {
        counts[v]++;
    }

    int[] result = new int[values.length];
    int index = 0;
    for (int v = 0; v <= max_value; v++) {
        for (int c = 0; c < counts[v]; c++) {
            result[index] = v;
            index++;
        }
    }
    return result;
}

void main() {
    int[] values = { 4, 2, 2, 8, 3, 3, 1 };
    int[] sorted = counting_sort(values, 8);
    foreach (int v in sorted) {
        stdout.printf("%d ", v);
    }
    stdout.printf("\n");
}
