#!/usr/bin/awk -f
function count(a,    k, n) {
    n = 0
    for (k in a) n++
    return n
}
BEGIN {
    for (i = 1; i <= 5; i++) a[i] = i * i
    print "size:", count(a)
    delete a[3]
    print "after delete a[3]:", count(a), (3 in a) ? "present" : "absent"
    delete a            # clear the whole array
    print "after clear:", count(a)
}
