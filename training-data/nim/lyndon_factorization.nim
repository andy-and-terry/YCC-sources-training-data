proc duval(s: string): seq[string] =
  var i = 0
  while i < s.len:
    var j = i + 1
    var k = i
    while j < s.len and s[k] <= s[j]:
      k = if s[k] < s[j]: i else: k + 1
      inc j
    while i <= k:
      result.add s[i ..< i + j - k]
      i += j - k

echo duval("banana")
