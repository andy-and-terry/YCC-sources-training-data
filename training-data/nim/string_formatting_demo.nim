import std/strformat

let name = "Nim"
let pi = 3.14159265
echo fmt"Hello, {name}!"
echo fmt"pi = {pi:.3f}"
echo fmt"{42:>6}|{42:<6}|{42:^6}|"
echo fmt"hex {255:#x} bin {5:b}"
echo &"{name.len} chars in {name}"
