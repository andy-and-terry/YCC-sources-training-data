import tables, strutils

var counts = initCountTable[string]()
for w in "a b a c b a".split(' '):
  counts.inc(w)
echo counts
var t = {"x": 1, "y": 2}.toTable
t["z"] = 3
for k, v in t: echo k, "=", v
echo t.getOrDefault("q", -1)
