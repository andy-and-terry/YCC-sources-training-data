# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
function is_keith(n,    seq, k, len, i, sum) {
    k = length(n)
    for (i = 1; i <= k; i++) seq[i] = substr(n, i, 1) + 0
    len = k
    while (seq[len] < n) {
        sum = 0
        for (i = len - k + 1; i <= len; i++) sum += seq[i]
        seq[++len] = sum
    }
    return seq[len] == n
}
BEGIN {
    for (n = 10; n < 1200; n++) if (is_keith(n)) printf "%d ", n
    print ""
}
