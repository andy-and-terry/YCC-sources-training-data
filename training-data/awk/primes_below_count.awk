function count_primes_below(n,    i, j, count, composite) {
    for (i = 2; i < n; i++) {
        if (composite[i]) continue
        count++
        for (j = i * i; j < n; j += i) composite[j] = 1
    }
    return count + 0
}

BEGIN { print count_primes_below(100) }
