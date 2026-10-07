proc encode(s: string): string =
  var i = 0
  while i < s.len:
    var j = i
    while j < s.len and s[j] == s[i]:
      inc j
    result.add($(j - i))
    result.add(s[i])
    i = j

proc decode(s: string): string =
  var count = 0
  for c in s:
    if c in {'0'..'9'}:
      count = count * 10 + (ord(c) - ord('0'))
    else:
      result.add(repeat(c, count))
      count = 0

import strutils
let enc = encode("aaabccddddd")
echo enc
echo decode(enc)
