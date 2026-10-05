type Color = enum red, green, blue, yellow

let warm = {red, yellow}
let primary = {red, green, blue}
echo warm + primary
echo warm * primary
echo primary - warm
echo green in primary
echo card(primary)

var seen: set[char] = {}
for c in "hello world":
  if c in {'a'..'z'}: seen.incl c
echo seen
