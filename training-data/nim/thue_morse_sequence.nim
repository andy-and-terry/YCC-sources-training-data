import std/bitops

# Thue-Morse: t(n) is the parity of the number of 1 bits in n
var s = ""
for n in 0 ..< 32:
  s.add($(popcount(n) mod 2))
echo s
