import tables, strutils

var counts = initCountTable[string]()
for w in "the cat and the hat and the bat".split:
  counts.inc w
counts.sort()
for k, v in counts:
  echo k, " ", v
