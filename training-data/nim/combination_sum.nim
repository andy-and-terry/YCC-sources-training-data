proc combinationSum(candidates: seq[int], target: int): seq[seq[int]] =
  result = @[]
  var current: seq[int] = @[]

  proc backtrack(start, remaining: int) =
    if remaining == 0:
      result.add(current)
      return
    if remaining < 0:
      return
    for i in start ..< candidates.len:
      current.add(candidates[i])
      backtrack(i, remaining - candidates[i])
      discard current.pop()

  backtrack(0, target)

echo combinationSum(@[2, 3, 6, 7], 7)
echo combinationSum(@[2, 3, 5], 8)
