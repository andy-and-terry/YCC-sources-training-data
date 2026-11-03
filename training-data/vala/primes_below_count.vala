int count_primes_below (int n) {
    if (n < 3) return 0;
    var composite = new bool[n];
    int count = 0;
    for (int i = 2; i < n; i++) {
        if (composite[i]) continue;
        count++;
        for (int j = i * i; j < n; j += i) composite[j] = true;
    }
    return count;
}

void main () {
    print ("%d\n", count_primes_below (100));
}
