import tables, strutils

var t = initCountTable[string]()
for w in "a b a c a b".split: t.inc(w)
echo t
