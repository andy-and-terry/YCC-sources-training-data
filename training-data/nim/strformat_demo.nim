import std/strformat

let name = "Ada"
let score = 93.456
let items = 7

echo fmt"Name: {name}, items: {items}"
echo fmt"Score: {score:.2f}"
echo fmt"Padded: [{name:>8}] [{name:<8}] [{name:^8}]"
echo fmt"Zero padded: {items:03}"
echo fmt"Hex: {255:#x}  Binary: {5:b}"
echo fmt"Expression: {items * 2 + 1}"
echo &"Literal braces: {{ok}} and value {items}\tdone"
echo fmt"{name=}"
