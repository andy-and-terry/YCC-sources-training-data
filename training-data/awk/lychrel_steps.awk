function reverse(s,   r, i) {
    r = ""
    for (i = length(s); i > 0; i--) r = r substr(s, i, 1)
    return r
}
# Reverse-and-add until a palindrome; count the steps.
function steps(n,   count) {
    for (count = 0; count < 50; count++) {
        if (count > 0 && n "" == reverse(n "")) return count
        n = n + reverse(n "")
    }
    return -1
}
BEGIN {
    split("56 57 59 79 89", starts, " ")
    for (i = 1; i <= 5; i++) printf "%d ", steps(starts[i])
    print ""
}
