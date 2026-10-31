import strutils

proc isSelfDescribing(s: string): bool =
  for i, c in s:
    if s.count(char(ord('0') + i)) != ord(c) - ord('0'): return false
  true

for s in ["1210", "2020", "21200", "1211"]:
  echo s, " ", isSelfDescribing(s)
