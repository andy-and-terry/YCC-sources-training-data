import std/strformat
import std/strutils

let name = "Ada"
let score = 93.4567
let count = 7

echo fmt"{name} scored {score:.2f}"
echo fmt"count={count:>5}|"
echo fmt"count={count:<5}|"
echo fmt"count={count:05}"
echo fmt"hex={255:#x} bin={5:b}"
echo fmt"{count * 2 = }"

echo "total".alignLeft(8, '.'), "42".align(6)
echo formatFloat(3.14159, ffDecimal, 3)
echo "x".repeat(5)
