import strutils, algorithm, sequtils

proc normalize(s: string): seq[char] =
  result = s.toLowerAscii.filterIt(it != ' ').toSeq
  result.sort()

proc isAnagram(a, b: string): bool =
  result = normalize(a) == normalize(b)

echo isAnagram("listen", "silent")
echo isAnagram("hello", "world")
