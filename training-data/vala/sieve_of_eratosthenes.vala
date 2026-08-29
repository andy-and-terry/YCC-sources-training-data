int[] sieve(int limit) {
    bool[] is_composite = new bool[limit + 1];
    for (int i = 2; i * i <= limit; i++) {
        if (!is_composite[i]) {
            for (int j = i * i; j <= limit; j += i) {
                is_composite[j] = true;
            }
        }
    }
    int[] result = {};
    for (int n = 2; n <= limit; n++) {
        if (!is_composite[n]) result += n;
    }
    return result;
}

void main() {
    foreach (int p in sieve(50)) {
        stdout.printf("%d ", p);
    }
    stdout.printf("\n");
}
