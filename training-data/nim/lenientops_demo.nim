import std/lenientops

# Normally Nim refuses to mix int and float in arithmetic.
# Importing lenientops converts the int operand automatically.
let count = 7
let price = 2.5

echo count * price     # 17.5
echo price + count     # 9.5
echo count / 2         # 3.5
echo count < price     # false
echo count >= 7.0      # true

var total = 0.0
for n in 1 .. 4:
  total += n * 0.25    # int * float without an explicit float()
echo total             # 2.5
