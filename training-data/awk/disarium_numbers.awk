# Disarium numbers: digits raised to their 1-based positions sum to n.
function is_disarium(n,    i, sum) {
    sum = 0
    for (i = 1; i <= length(n); i++) sum += (substr(n, i, 1) + 0) ^ i
    return sum == n
}
BEGIN {
    for (n = 1; n < 1000; n++) if (is_disarium(n)) printf "%d ", n
    print ""
}
