let s = "abcabc"
const k = 3
const B = 31
const M = 1_000_003
for i in 0 .. s.len - k:
  var h = 0
  for c in s[i ..< i + k]:
    h = (h * B + ord(c)) mod M
  echo i, " ", h
