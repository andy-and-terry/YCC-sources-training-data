int rod_cutting(int[] prices, int length) {
    int[] best = new int[length + 1];
    best[0] = 0;

    for (int i = 1; i <= length; i++) {
        int max_value = int.MIN;
        for (int cut = 1; cut <= i; cut++) {
            int value = prices[cut - 1] + best[i - cut];
            if (value > max_value) {
                max_value = value;
            }
        }
        best[i] = max_value;
    }

    return best[length];
}

void main() {
    int[] prices = { 1, 5, 8, 9, 10, 17, 17, 20 };
    stdout.printf("%d\n", rod_cutting(prices, prices.length));
    stdout.printf("%d\n", rod_cutting(prices, 4));
}
