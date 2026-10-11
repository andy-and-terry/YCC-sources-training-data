import std/tables

var counts = initCountTable[char]()
for c in "mississippi":
  counts.inc c
echo counts
echo counts.largest
echo counts['s']
counts.sort()
for k, v in counts: echo k, " ", v

let t = toCountTable(["a", "b", "a"])
echo t["a"]
