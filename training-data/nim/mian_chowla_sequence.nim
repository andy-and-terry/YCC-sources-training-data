import std/[sets, strutils]

# Greedy sequence whose pairwise sums are all distinct.
var seq: seq[int]
var sums = initHashSet[int]()
var cand = 1
while seq.len < 8:
  var fresh = initHashSet[int]()
  var ok = true
  for x in seq & @[cand]:
    let s = x + cand
    if s in sums or s in fresh:
      ok = false
      break
    fresh.incl s
  if ok:
    seq.add cand
    sums = sums + fresh
  inc cand

var parts: seq[string]
for v in seq: parts.add $v
echo parts.join(" ")
