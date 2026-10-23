import std/[unicode, algorithm]

let s = "héllo wörld, 你好"

# `len` counts bytes while `runeLen` counts Unicode code points
echo "bytes: ", s.len
echo "runes: ", s.runeLen

# Iterate over runes rather than bytes
for r in s.runes:
  if r.int > 127:
    echo "non-ascii: ", r, " U+", r.int.toHex(4)

# Case conversion and reversal that respect multi-byte characters
echo s.toUpper()
echo s.reversed()
echo s.capitalize()

# Index by rune position
echo "third rune: ", s.runeAt(s.runeOffset(2))
echo "substring:   ", s.runeSubStr(7, 5)

# Convert to a seq of runes and back
var rs = toRunes(s)
rs.reverse()
echo $rs
echo "valid utf8? ", validateUtf8(s) == -1
