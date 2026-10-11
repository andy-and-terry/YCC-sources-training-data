import std/tables

var groups = initTable[string, seq[int]]()
for (k, v) in [("a", 1), ("b", 2), ("a", 3)]:
  groups.mgetOrPut(k, @[]).add v
echo groups

var t = {"x": 1}.toTable
t.withValue("x", val):
  val[] += 10
do:
  echo "missing"
echo t["x"]
echo t.getOrDefault("nope", -1)
echo t.hasKeyOrPut("y", 5), " ", t["y"]
t.del("x")
echo t.len
