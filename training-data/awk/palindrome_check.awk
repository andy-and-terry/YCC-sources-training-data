#!/usr/bin/awk -f
function reverse(s,    r, i) {
    r = ""
    for (i = length(s); i >= 1; i--) {
        r = r substr(s, i, 1)
    }
    return r
}
{
    if ($0 == reverse($0)) {
        print $0, "is a palindrome"
    } else {
        print $0, "is not a palindrome"
    }
}
