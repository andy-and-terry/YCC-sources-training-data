import strutils

proc isRotation(a, b: string): bool =
  a.len == b.len and (a & a).contains(b)

echo isRotation("waterbottle", "erbottlewat")
echo isRotation("abc", "acb")
