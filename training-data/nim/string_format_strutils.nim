import strutils, strformat
let n = 3.14159
echo fmt"{n:.2f} {42:05d}"
echo "a,b,c".split(',').join("+")
echo "Hello".toUpperAscii, " ", "x".repeat(3)
