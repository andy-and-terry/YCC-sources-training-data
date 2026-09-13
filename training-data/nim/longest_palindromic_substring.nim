proc longestPalindrome(s: string): string =
  if s.len == 0:
    return ""
  var start = 0
  var maxLen = 1
  proc expand(l, r: int): int =
    var l = l
    var r = r
    while l >= 0 and r < s.len and s[l] == s[r]:
      l -= 1
      r += 1
    r - l - 1
  for i in 0 ..< s.len:
    let len1 = expand(i, i)
    let len2 = expand(i, i + 1)
    let length = max(len1, len2)
    if length > maxLen:
      maxLen = length
      start = i - (length - 1) div 2
  s[start ..< start + maxLen]

echo longestPalindrome("babad")
echo longestPalindrome("cbbd")
