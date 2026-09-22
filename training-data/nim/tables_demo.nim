import std/tables

var ages = initTable[string, int]()
ages["Alice"] = 30
ages["Bob"] = 25
ages["Carol"] = 35

echo ages["Alice"]
echo ages.hasKey("Dave")

for name, age in ages:
  echo name, " is ", age

ages.del("Bob")
echo ages.len

let fixed = {"x": 1, "y": 2}.toTable
echo fixed
