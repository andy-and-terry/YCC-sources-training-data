import std/sets

var s = initOrderedSet[string]()
for w in ["pear", "apple", "pear", "fig"]:
  s.incl w
echo s
for x in s: stdout.write x, " "
echo ""
echo s.contains("fig"), " ", s.len
s.excl "apple"
echo s
echo toOrderedSet([3, 1, 3, 2])
