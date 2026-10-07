proc zArray(s: string): seq[int] =
  let n = s.len
  result = newSeq[int](n)
  var l = 0
  var r = 0
  for i in 1 ..< n:
    if i < r:
      result[i] = min(r - i, result[i - l])
    while i + result[i] < n and s[result[i]] == s[i + result[i]]:
      inc result[i]
    if i + result[i] > r:
      l = i
      r = i + result[i]

proc search(text, pattern: string): seq[int] =
  let combined = pattern & "$" & text
  let z = zArray(combined)
  let patLen = pattern.len
  for i in 0 ..< z.len:
    if z[i] == patLen:
      result.add(i - patLen - 1)

echo search("abxabcabcaby", "abcaby")
echo zArray("aabxaab")
