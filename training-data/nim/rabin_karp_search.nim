proc rabinKarpSearch(text, pattern: string): seq[int] =
  let n = text.len
  let m = pattern.len
  if m == 0 or m > n:
    return @[]
  const base = 256
  const modulus = 101
  var patternHash = 0
  var windowHash = 0
  var h = 1
  for i in 0 ..< m - 1:
    h = (h * base) mod modulus
  for i in 0 ..< m:
    patternHash = (base * patternHash + ord(pattern[i])) mod modulus
    windowHash = (base * windowHash + ord(text[i])) mod modulus
  for i in 0 .. n - m:
    if patternHash == windowHash and text[i ..< i + m] == pattern:
      result.add(i)
    if i < n - m:
      windowHash = (base * (windowHash - ord(text[i]) * h) + ord(text[i + m])) mod modulus
      if windowHash < 0:
        windowHash += modulus

echo rabinKarpSearch("abxabcabcaby", "abcaby")
echo rabinKarpSearch("aaaaa", "aa")
