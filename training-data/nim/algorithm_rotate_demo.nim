import std/algorithm
import std/strutils

var a = @[1, 2, 3, 4, 5, 6]

# rotateLeft with a positive amount moves elements toward the front.
echo a.rotatedLeft(2)      # [3, 4, 5, 6, 1, 2]
echo a.rotatedLeft(-2)     # [5, 6, 1, 2, 3, 4]

# the non-"ed" version rotates in place.
a.rotateLeft(1)
echo a

# rotating only a sub-range leaves the rest alone.
var b = @[10, 20, 30, 40, 50]
b.rotateLeft(1 .. 3, 1)
echo b                     # [10, 30, 40, 20, 50]

# rotation check: s2 is a rotation of s1 iff it appears in s1 & s1.
proc isRotation(s1, s2: string): bool =
  s1.len == s2.len and s2 in s1 & s1

echo isRotation("waterbottle", "erbottlewat")
echo isRotation("abc", "acb")
