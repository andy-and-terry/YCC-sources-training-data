import tables, strutils

var counts = initCountTable[string]()
for w in "a b a c a".split: counts.inc(w)
echo counts
