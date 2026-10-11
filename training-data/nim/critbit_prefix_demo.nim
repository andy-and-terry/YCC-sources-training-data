import std/critbits

var t: CritBitTree[int]
t["apple"] = 1
t["apricot"] = 2
t["banana"] = 3
for k, v in t.pairsWithPrefix("ap"):
  echo k, " ", v
echo t.contains("banana")
echo t.contains("band")
for k in t.keys: stdout.write k, " "
echo ""
