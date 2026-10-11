import std/strscans

var name: string
var age: int
if scanf("alice 30", "$w $i", name, age):
  echo name, " is ", age

var x, y: int
if scanf("(10, 20)", "($i, $i)", x, y):
  echo x + y

echo scanf("no match", "$i", x)
