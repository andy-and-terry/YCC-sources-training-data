import algorithm, sequtils

proc buildSuffixArray(s: string): seq[int] =
  var indices = toSeq(0 ..< s.len)
  indices.sort(proc (a, b: int): int = cmp(s[a ..< s.len], s[b ..< s.len]))
  result = indices

let text = "banana"
let sa = buildSuffixArray(text)
echo sa
for i in sa:
  echo text[i ..< text.len]
