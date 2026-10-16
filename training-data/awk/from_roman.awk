#!/usr/bin/awk -f
function from_roman(s,   v, i, c, cur, prev, total) {
    v["I"]=1; v["V"]=5; v["X"]=10; v["L"]=50; v["C"]=100; v["D"]=500; v["M"]=1000
    total = 0; prev = 0
    for (i = length(s); i >= 1; i--) {
        cur = v[substr(s, i, 1)]
        if (cur < prev) total -= cur; else total += cur
        prev = cur
    }
    return total
}
BEGIN {
    print from_roman("MCMXCIV")
    print from_roman("XLII")
}
