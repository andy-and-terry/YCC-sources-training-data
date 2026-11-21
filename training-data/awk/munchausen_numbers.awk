# Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
function is_munchausen(n,    i, d, sum) {
    sum = 0
    for (i = 1; i <= length(n); i++) {
        d = substr(n, i, 1) + 0
        if (d > 0) sum += d ^ d
    }
    return sum == n
}
BEGIN {
    for (n = 1; n < 5000; n++) if (is_munchausen(n)) printf "%d ", n
    print ""
}
