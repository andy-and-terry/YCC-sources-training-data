import std/unicode

let s = "héllo wörld"
echo s.len
echo s.runeLen
for r in s.runes:
  if r.isUpper or r.isLower:
    stdout.write r.toUpper
echo ""
echo s.reversed
echo s.toUpper
echo s.runeAt(1)
