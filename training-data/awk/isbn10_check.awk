#!/usr/bin/awk -f
function valid_isbn10(s,   i, sum, c) {
    if (s !~ /^[0-9]{9}[0-9X]$/) return 0
    for (i = 1; i <= 10; i++) {
        c = substr(s, i, 1)
        sum += (c == "X" ? 10 : c + 0) * (11 - i)
    }
    return sum % 11 == 0
}
BEGIN {
    print valid_isbn10("0306406152")
    print valid_isbn10("0306406153")
}
