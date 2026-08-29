int kadane(int[] items) {
    int best = items[0];
    int current = items[0];
    for (int i = 1; i < items.length; i++) {
        current = int.max(items[i], current + items[i]);
        best = int.max(best, current);
    }
    return best;
}

void main() {
    int[] data = { -2, 1, -3, 4, -1, 2, 1, -5, 4 };
    stdout.printf("%d\n", kadane(data));
}
