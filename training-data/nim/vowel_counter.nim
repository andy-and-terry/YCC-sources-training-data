import std/[tables, strutils]

var counts = initCountTable[char]()
for c in "Education is beautiful".toLowerAscii:
  if c in "aeiou": counts.inc c
for c in "aeiou":
  stdout.write c, "=", counts[c], " "
echo ""
