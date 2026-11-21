# Cyclops numbers: odd digit count, middle digit zero, no other zeros.
# Count those in 1..99999 (expected 6642).
function is_cyclops(n,    len, tmp) {
    len = length(n)
    tmp = n
    gsub(/[^0]/, "", tmp)
    return len % 2 == 1 && substr(n, int(len / 2) + 1, 1) == "0" && length(tmp) == 1
}
BEGIN {
    for (n = 1; n < 100000; n++) if (is_cyclops(n)) count++
    print count
}
