import strformat

let name = "Nim"
let version = 2.0
let n = 42
echo fmt"Hello {name} {version}"
echo fmt"{n:>6}|{n:<6}|{n:^6}|"
echo fmt"{n:#x} {n:#b} {n:05d}"
echo fmt"{3.14159265:.3f}"
echo &"{name.len} chars, doubled: {n * 2}"
echo fmt"{{literal braces}}"
