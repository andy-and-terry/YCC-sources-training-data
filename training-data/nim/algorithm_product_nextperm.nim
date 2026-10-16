import std/algorithm

var p = @[1, 2, 3]
echo p
while p.nextPermutation:
  echo p

var q = @[3, 2, 1]
echo q.prevPermutation, " ", q
echo product(@[@[1, 2], @[3, 4]])
