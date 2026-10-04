#!/usr/bin/awk -f
# Demonstrates membership tests, deleting single elements and clearing whole arrays.
function count(arr,    k, n) {
    n = 0
    for (k in arr) n++
    return n
}

BEGIN {
    stock["apple"] = 5
    stock["pear"] = 0
    stock["plum"] = 12
    print "items:", count(stock)

    if ("apple" in stock) print "apple present"
    if (!("kiwi" in stock)) print "kiwi absent"

    # referencing a missing key creates it -- use 'in' to avoid that
    if (stock["kiwi"] == 0) print "kiwi lookup created an entry"
    print "items:", count(stock)

    for (k in stock) {
        if (stock[k] == 0) delete stock[k]   # deleting during iteration is safe in awk
    }
    print "items after pruning:", count(stock)

    delete stock                             # remove every element
    print "items after clear:", count(stock)
}
