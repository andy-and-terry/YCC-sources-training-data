#!/usr/bin/awk -f
# Deleting elements, testing membership with `in`, and clearing arrays.
BEGIN {
    for (i = 1; i <= 5; i++) a[i] = i * i
    delete a[3]
    print (3 in a) ? "3 present" : "3 deleted"
    print length(a), "elements left"
    delete a
    print length(a), "elements after clear"
}
