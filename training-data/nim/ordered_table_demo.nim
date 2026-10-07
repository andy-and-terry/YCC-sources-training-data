import std/tables

var scores = initOrderedTable[string, int]()
scores["charlie"] = 88
scores["alice"] = 95
scores["bob"] = 91

echo "insertion order:"
for name, score in scores:
  echo name, ": ", score

scores.sort(proc (a, b: (string, int)): int = cmp(a[1], b[1]))
echo "sorted by score:"
for name, score in scores:
  echo name, ": ", score
