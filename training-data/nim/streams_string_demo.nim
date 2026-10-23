import std/streams
import std/strutils

# StringStream lets us use the stream API on an in-memory string.
let input = newStringStream("alpha 1\nbeta 2\ngamma 3\n")
var line = ""
var total = 0
while input.readLine(line):
  let parts = line.split(' ')
  echo parts[0], " -> ", parts[1]
  total += parts[1].parseInt
input.close()
echo "total: ", total

# Writing binary values and reading them back from the same buffer.
let output = newStringStream()
output.write(42'i32)
output.write(3.5'f64)
output.write("hi")
output.setPosition(0)
echo output.readInt32()
echo output.readFloat64()
echo output.readStr(2)
echo "at end: ", output.atEnd()
