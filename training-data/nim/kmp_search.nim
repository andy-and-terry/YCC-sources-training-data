proc buildLps(pattern: string): seq[int] =
  let n = pattern.len
  result = newSeq[int](n)
  var length = 0
  var i = 1
  while i < n:
    if pattern[i] == pattern[length]:
      inc length
      result[i] = length
      inc i
    elif length != 0:
      length = result[length - 1]
    else:
      result[i] = 0
      inc i

proc kmpSearch(text, pattern: string): int =
  let lps = buildLps(pattern)
  let n = text.len
  let m = pattern.len
  var i, j = 0
  while i < n:
    if text[i] == pattern[j]:
      inc i
      inc j
      if j == m:
        return i - j
    elif j > 0:
      j = lps[j - 1]
    else:
      inc i
  result = -1

echo kmpSearch("abxabcabcaby", "abcaby")
