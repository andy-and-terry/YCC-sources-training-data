import strformat, strutils

let name = "Nim"
let version = 2.0
let n = 42

echo fmt"Hello {name} v{version}"
echo fmt"{n:>6}|{n:<6}|{n:^6}|"
echo fmt"{n:08b} {n:#x} {n:o}"
echo fmt"{3.14159265:.3f}"
echo fmt"{name=} {n=}"
echo "total: " & align($n, 5, '.')
echo "abc".alignLeft(6, '*') & "|"
