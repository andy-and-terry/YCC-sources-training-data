proc addBinary(a, b: string): string =
  var i = a.high
  var j = b.high
  var carry = 0
  while i >= 0 or j >= 0 or carry > 0:
    var sum = carry
    if i >= 0:
      sum += ord(a[i]) - ord('0')
      dec i
    if j >= 0:
      sum += ord(b[j]) - ord('0')
      dec j
    result = $(sum mod 2) & result
    carry = sum div 2

echo addBinary("1010", "1011") # 10101
