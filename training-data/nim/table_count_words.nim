import std/[tables, strutils]

var counts = initCountTable[string]()
for w in "a b a c a b".split:
  counts.inc(w)
for k, v in counts:
  echo k, ": ", v
