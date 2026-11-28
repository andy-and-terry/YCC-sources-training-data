import std/sets

proc jaccard[T](a, b: HashSet[T]): float =
  let u = (a + b).len
  if u == 0: 1.0 else: (a * b).len / u

echo jaccard([1, 2, 3, 4].toHashSet, [3, 4, 5].toHashSet)
